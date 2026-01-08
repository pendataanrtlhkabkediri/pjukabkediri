import xml.etree.ElementTree as ET
import re
import os

# Namespace untuk KML
ns = {'kml': 'http://www.opengis.net/kml/2.2'}

def extract_box_name(text):
    """Extract box name from placemark name"""
    # Pattern: "Desa [Nama Desa] Box [Nomor]"
    match = re.search(r'(Desa\s+\w+\s+Box\s+\d+)', text, re.IGNORECASE)
    if match:
        return match.group(1).strip()
    return None

def parse_kml_boxes(filepath):
    """Parse Kecamatan Kunjang.kml untuk mendapatkan daftar Box Panel"""
    tree = ET.parse(filepath)
    root = tree.getroot()

    boxes = []
    for placemark in root.findall('.//kml:Placemark', ns):
        name = placemark.find('kml:name', ns)
        coords = placemark.find('.//kml:coordinates', ns)

        if name is not None and coords is not None:
            box_name = name.text.strip()
            coord_text = coords.text.strip()
            lon, lat, alt = coord_text.split(',')

            boxes.append({
                'name': box_name,
                'longitude': float(lon),
                'latitude': float(lat)
            })

    return boxes

def parse_kml_lampu(filepath, box_list):
    """Parse file KML lampu PJU per desa"""
    tree = ET.parse(filepath)
    root = tree.getroot()

    desa_name = os.path.basename(filepath).replace('.csv.kml', '').replace('Kec Kunjang- ', '')

    lampu_list = []
    for placemark in root.findall('.//kml:Placemark', ns):
        name_elem = placemark.find('kml:name', ns)
        coords_elem = placemark.find('.//kml:coordinates', ns)

        if name_elem is not None and coords_elem is not None:
            name = name_elem.text.strip() if name_elem.text else ""
            coord_text = coords_elem.text.strip()
            lon, lat, alt = coord_text.split(',')

            # Extract data dari ExtendedData
            lampu_type = ""
            jenis_jalan = ""

            for data in placemark.findall('.//kml:Data', ns):
                data_name = data.get('name')
                value = data.find('kml:value', ns)

                if data_name == 'lampu' and value is not None:
                    lampu_type = value.text.strip() if value.text else ""
                elif data_name == 'Jenis Jalan' and value is not None:
                    jenis_jalan = value.text.strip() if value.text else ""

            # Check relasi dengan box
            box_name = extract_box_name(name)
            connected = False
            box_id = None

            if box_name:
                # Cek apakah box_name ada di list boxes
                for idx, box in enumerate(box_list):
                    if box_name.lower() in box['name'].lower():
                        connected = True
                        box_id = idx + 1
                        break

            lampu_list.append({
                'name': name,
                'desa': desa_name,
                'longitude': float(lon),
                'latitude': float(lat),
                'lampu_type': lampu_type,
                'jenis_jalan': jenis_jalan,
                'box_name': box_name if box_name else 'TIDAK TERSAMBUNG',
                'connected': connected,
                'box_id': box_id
            })

    return lampu_list

def generate_sql(boxes, all_lampu):
    """Generate SQL file untuk database"""

    sql_content = """-- =====================================================
-- DATABASE PENERANGAN JALAN UMUM (PJU)
-- KECAMATAN KUNJANG - KABUPATEN KEDIRI
-- =====================================================

-- Buat database
CREATE DATABASE IF NOT EXISTS pju_kunjang;
USE pju_kunjang;

-- =====================================================
-- TABEL 1: BOX PANEL PJU
-- =====================================================
DROP TABLE IF EXISTS box_panel;
CREATE TABLE box_panel (
    box_id INT PRIMARY KEY AUTO_INCREMENT,
    box_name VARCHAR(100) NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,
    latitude DECIMAL(10, 7) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

"""

    # Insert Box Panel
    sql_content += "\n-- Insert data Box Panel\n"
    for idx, box in enumerate(boxes, 1):
        sql_content += f"INSERT INTO box_panel (box_id, box_name, longitude, latitude) VALUES ({idx}, '{box['name']}', {box['longitude']}, {box['latitude']});\n"

    # Tabel Lampu PJU
    sql_content += """
-- =====================================================
-- TABEL 2: LAMPU PJU
-- =====================================================
DROP TABLE IF EXISTS lampu_pju;
CREATE TABLE lampu_pju (
    lampu_id INT PRIMARY KEY AUTO_INCREMENT,
    lampu_name VARCHAR(200) NOT NULL,
    desa VARCHAR(100) NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,
    latitude DECIMAL(10, 7) NOT NULL,
    lampu_type VARCHAR(50),
    jenis_jalan VARCHAR(20),
    box_id INT,
    status_koneksi ENUM('TERSAMBUNG', 'TIDAK TERSAMBUNG') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (box_id) REFERENCES box_panel(box_id) ON DELETE SET NULL,
    INDEX idx_desa (desa),
    INDEX idx_status (status_koneksi),
    INDEX idx_box (box_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

"""

    # Insert Lampu PJU
    sql_content += "\n-- Insert data Lampu PJU\n"
    for idx, lampu in enumerate(all_lampu, 1):
        name_escaped = lampu['name'].replace("'", "''")
        box_id_value = str(lampu['box_id']) if lampu['box_id'] else 'NULL'
        status = 'TERSAMBUNG' if lampu['connected'] else 'TIDAK TERSAMBUNG'

        sql_content += f"""INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES ({idx}, '{name_escaped}', '{lampu['desa']}', {lampu['longitude']}, {lampu['latitude']}, '{lampu['lampu_type']}', '{lampu['jenis_jalan']}', {box_id_value}, '{status}');\n"""

    # Views dan Queries
    sql_content += """
-- =====================================================
-- VIEWS DAN QUERIES ANALISIS
-- =====================================================

-- View: Ringkasan per Box Panel
CREATE OR REPLACE VIEW view_box_summary AS
SELECT
    bp.box_id,
    bp.box_name,
    bp.longitude,
    bp.latitude,
    COUNT(lp.lampu_id) as total_lampu_tersambung
FROM box_panel bp
LEFT JOIN lampu_pju lp ON bp.box_id = lp.box_id AND lp.status_koneksi = 'TERSAMBUNG'
GROUP BY bp.box_id, bp.box_name, bp.longitude, bp.latitude
ORDER BY bp.box_id;

-- View: Ringkasan per Desa
CREATE OR REPLACE VIEW view_desa_summary AS
SELECT
    desa,
    COUNT(*) as total_lampu,
    SUM(CASE WHEN status_koneksi = 'TERSAMBUNG' THEN 1 ELSE 0 END) as lampu_tersambung,
    SUM(CASE WHEN status_koneksi = 'TIDAK TERSAMBUNG' THEN 1 ELSE 0 END) as lampu_tidak_tersambung,
    ROUND(SUM(CASE WHEN status_koneksi = 'TERSAMBUNG' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as persentase_tersambung
FROM lampu_pju
GROUP BY desa
ORDER BY total_lampu DESC;

-- View: Lampu yang Tidak Tersambung
CREATE OR REPLACE VIEW view_lampu_tidak_tersambung AS
SELECT
    lampu_id,
    lampu_name,
    desa,
    longitude,
    latitude,
    lampu_type,
    jenis_jalan
FROM lampu_pju
WHERE status_koneksi = 'TIDAK TERSAMBUNG'
ORDER BY desa, lampu_id;

-- View: Detail Relasi Box dengan Lampu
CREATE OR REPLACE VIEW view_box_lampu_detail AS
SELECT
    bp.box_id,
    bp.box_name,
    bp.longitude as box_longitude,
    bp.latitude as box_latitude,
    lp.lampu_id,
    lp.lampu_name,
    lp.desa,
    lp.longitude as lampu_longitude,
    lp.latitude as lampu_latitude,
    lp.lampu_type,
    lp.jenis_jalan
FROM box_panel bp
INNER JOIN lampu_pju lp ON bp.box_id = lp.box_id
WHERE lp.status_koneksi = 'TERSAMBUNG'
ORDER BY bp.box_id, lp.lampu_id;

-- =====================================================
-- QUERIES STATISTIK
-- =====================================================

-- Total Lampu per Status
SELECT
    status_koneksi,
    COUNT(*) as jumlah,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM lampu_pju), 2) as persentase
FROM lampu_pju
GROUP BY status_koneksi;

-- Total Lampu per Jenis
SELECT
    lampu_type,
    COUNT(*) as jumlah
FROM lampu_pju
GROUP BY lampu_type
ORDER BY jumlah DESC;

-- Ringkasan Keseluruhan
SELECT
    COUNT(*) as total_lampu,
    (SELECT COUNT(*) FROM box_panel) as total_box,
    SUM(CASE WHEN status_koneksi = 'TERSAMBUNG' THEN 1 ELSE 0 END) as lampu_tersambung,
    SUM(CASE WHEN status_koneksi = 'TIDAK TERSAMBUNG' THEN 1 ELSE 0 END) as lampu_tidak_tersambung,
    COUNT(DISTINCT desa) as total_desa
FROM lampu_pju;

-- =====================================================
-- END OF SQL FILE
-- =====================================================
"""

    return sql_content

def main():
    print("=" * 60)
    print("ANALISIS RELASI BOX PANEL PJU DAN LAMPU PJU")
    print("Kecamatan Kunjang - Kabupaten Kediri")
    print("=" * 60)

    # Parse Box Panel
    print("\n1. Parsing Box Panel dari Kecamatan Kunjang.kml...")
    boxes = parse_kml_boxes('Kecamatan Kunjang.kml')
    print(f"   [OK] Ditemukan {len(boxes)} Box Panel")

    # Parse semua file lampu PJU
    print("\n2. Parsing Lampu PJU dari setiap desa...")

    lampu_files = [
        'DESA BALONGJERUK KEC KUNJANG.csv.kml',
        'DESA JUWET KEC KUNJANG.csv.kml',
        'DESA KAPI KEC KUNJANG.csv.kml',
        'DESA KUJANG KEC KUNJANG.csv.kml',
        'DESA PAKIS KEC KUNJANG.csv.kml',
        'Kec Kunjang- DESA TENGGER LOR KEC KUNJANG.csv.csv.kml',
        'Kec Kunjang- DESA WONOREJO KEC KUNJANG.csv.csv.kml'
    ]

    all_lampu = []
    for filename in lampu_files:
        if os.path.exists(filename):
            lampu_list = parse_kml_lampu(filename, boxes)
            all_lampu.extend(lampu_list)

            connected = sum(1 for l in lampu_list if l['connected'])
            not_connected = len(lampu_list) - connected

            desa_name = filename.replace('.csv.kml', '').replace('Kec Kunjang- ', '')
            print(f"   [OK] {desa_name}: {len(lampu_list)} lampu ({connected} tersambung, {not_connected} tidak tersambung)")

    print(f"\n   Total: {len(all_lampu)} lampu PJU")

    # Statistik
    total_connected = sum(1 for l in all_lampu if l['connected'])
    total_not_connected = len(all_lampu) - total_connected
    percentage = (total_connected / len(all_lampu) * 100) if all_lampu else 0

    print("\n3. Statistik Keseluruhan:")
    print(f"   - Total Box Panel: {len(boxes)}")
    print(f"   - Total Lampu PJU: {len(all_lampu)}")
    print(f"   - Lampu Tersambung: {total_connected} ({percentage:.1f}%)")
    print(f"   - Lampu Tidak Tersambung: {total_not_connected} ({100-percentage:.1f}%)")

    # Generate SQL
    print("\n4. Generate SQL File...")
    sql_content = generate_sql(boxes, all_lampu)

    with open('pju_kunjang_database.sql', 'w', encoding='utf-8') as f:
        f.write(sql_content)

    print(f"   [OK] File SQL berhasil dibuat: pju_kunjang_database.sql")

    # Generate JSON untuk HTML
    print("\n5. Generate JSON untuk visualisasi...")
    import json

    data_json = {
        'boxes': boxes,
        'lampu': all_lampu,
        'statistics': {
            'total_boxes': len(boxes),
            'total_lampu': len(all_lampu),
            'lampu_tersambung': total_connected,
            'lampu_tidak_tersambung': total_not_connected,
            'persentase_tersambung': round(percentage, 2)
        }
    }

    with open('pju_data.json', 'w', encoding='utf-8') as f:
        json.dump(data_json, f, ensure_ascii=False, indent=2)

    print(f"   [OK] File JSON berhasil dibuat: pju_data.json")

    print("\n" + "=" * 60)
    print("SELESAI!")
    print("=" * 60)

if __name__ == '__main__':
    main()
