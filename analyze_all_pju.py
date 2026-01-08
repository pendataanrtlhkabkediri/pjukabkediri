"""
Sistem Analisis PJU Multi-Kecamatan
Kabupaten Kediri - 2025

Fitur:
- Analisis relasi Box Panel dan Lampu PJU
- Support multiple kecamatan (Kunjang, Mojo, Pagu)
- Generate SQL database
- Generate JSON untuk visualisasi web
- Support upload KML baru dengan auto-detect relasi
"""

import xml.etree.ElementTree as ET
import re
import os
import json
from pathlib import Path

# Namespace untuk KML
ns = {'kml': 'http://www.opengis.net/kml/2.2'}

# Konfigurasi Kecamatan
KECAMATAN_CONFIG = {
    'KUNJANG': {
        'folder': 'KUNJANG',
        'box_file': 'Kecamatan Kunjang.kml',
        'lampu_files': [
            'DESA BALONGJERUK KEC KUNJANG.csv.kml',
            'DESA JUWET KEC KUNJANG.csv.kml',
            'DESA KAPI KEC KUNJANG.csv.kml',
            'DESA KUJANG KEC KUNJANG.csv.kml',
            'DESA PAKIS KEC KUNJANG.csv.kml',
            'Kec Kunjang- DESA TENGGER LOR KEC KUNJANG.csv.csv.kml',
            'Kec Kunjang- DESA WONOREJO KEC KUNJANG.csv.csv.kml'
        ]
    },
    'MOJO': {
        'folder': 'MOJO',
        'box_file': '5. Kec MOJO.csv.kml',
        'lampu_files': [
            'Desa Mlati Kecamatan Mojo.csv.kml',
            'Desa Mojo Kecamatan Mojo.csv.kml',
            'Ds. Mondo Kec. Mojo.csv.kml',
            'Ds. Petok Kec. Mojo.csv.kml',
            'Ds. Sukoanyar Kec. Mojo.csv.kml',
            'Ds. Surat Kec. Surat.csv.kml',
            'Ds. Tambibendo Kec. Mojo.csv.kml'
        ]
    },
    'PAGU': {
        'folder': 'PAGU',
        'box_file': 'kec pagu.csv.kml',
        'lampu_files': []  # Belum ada data lampu
    }
}


def extract_box_name(text):
    """Extract box name dari nama placemark"""
    if not text:
        return None

    # Pattern umum: Box [nomor] atau Box[nomor]
    patterns = [
        r'Box\s*(\d+)',  # Box 1, Box1
        r'box\s*(\d+)',  # box 1, box1
        r'BOX\s*(\d+)',  # BOX 1, BOX1
    ]

    for pattern in patterns:
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            return f"Box {match.group(1)}"

    return None


def normalize_desa_name(text):
    """Normalize nama desa dari filename atau text"""
    if not text:
        return ""

    # Remove common prefixes
    text = re.sub(r'^(Desa|Ds\.?|DESA)\s+', '', text, flags=re.IGNORECASE)
    text = re.sub(r'Kecamatan\s+\w+', '', text, flags=re.IGNORECASE)
    text = re.sub(r'Kec\.?\s+\w+', '', text, flags=re.IGNORECASE)
    text = re.sub(r'\.csv\.kml$', '', text, flags=re.IGNORECASE)
    text = re.sub(r'\.kml$', '', text, flags=re.IGNORECASE)

    return text.strip()


def parse_kml_boxes(filepath, kecamatan_name):
    """Parse file KML Box Panel"""
    tree = ET.parse(filepath)
    root = tree.getroot()

    boxes = []
    box_counter = {}

    for placemark in root.findall('.//kml:Placemark', ns):
        name_elem = placemark.find('kml:name', ns)
        coords_elem = placemark.find('.//kml:coordinates', ns)

        if name_elem is not None and coords_elem is not None:
            name = name_elem.text.strip() if name_elem.text else ""
            coord_text = coords_elem.text.strip()

            try:
                lon, lat, alt = coord_text.split(',')

                # Extract desa name dan box number
                box_num = extract_box_name(name)

                # Extract desa from name
                desa_match = re.search(r'(Desa|Ds\.?)\s+(\w+)', name, re.IGNORECASE)
                desa = desa_match.group(2) if desa_match else "Unknown"

                # Create unique box identifier
                box_key = f"{desa}_{box_num}" if box_num else name

                if box_key not in box_counter:
                    box_counter[box_key] = 0
                box_counter[box_key] += 1

                boxes.append({
                    'name': name,
                    'kecamatan': kecamatan_name,
                    'desa': desa,
                    'box_number': box_num,
                    'longitude': float(lon),
                    'latitude': float(lat),
                    'box_key': box_key
                })
            except ValueError:
                continue

    return boxes


def parse_kml_lampu(filepath, boxes, kecamatan_name):
    """Parse file KML lampu PJU"""
    tree = ET.parse(filepath)
    root = tree.getroot()

    # Extract desa name from filename
    filename = os.path.basename(filepath)
    desa_name = normalize_desa_name(filename)

    lampu_list = []

    for placemark in root.findall('.//kml:Placemark', ns):
        name_elem = placemark.find('kml:name', ns)
        coords_elem = placemark.find('.//kml:coordinates', ns)

        if name_elem is not None and coords_elem is not None:
            name = name_elem.text.strip() if name_elem.text else ""
            coord_text = coords_elem.text.strip()

            try:
                lon, lat, alt = coord_text.split(',')
            except ValueError:
                continue

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
            connected = False
            box_id = None
            matched_box_name = None

            # Extract box info from lampu name
            box_num = extract_box_name(name)

            if box_num:
                # Cari box yang match
                for idx, box in enumerate(boxes):
                    # Match by desa and box number
                    if (box['box_number'] == box_num and
                        desa_name.lower() in box['desa'].lower()):
                        connected = True
                        box_id = idx + 1
                        matched_box_name = box['name']
                        break

                    # Alternative: match if box name mentioned in lampu name
                    if box['name'].lower() in name.lower():
                        connected = True
                        box_id = idx + 1
                        matched_box_name = box['name']
                        break

            lampu_list.append({
                'name': name,
                'kecamatan': kecamatan_name,
                'desa': desa_name,
                'longitude': float(lon),
                'latitude': float(lat),
                'lampu_type': lampu_type,
                'jenis_jalan': jenis_jalan,
                'box_name': matched_box_name if matched_box_name else 'TIDAK TERSAMBUNG',
                'box_number': box_num,
                'connected': connected,
                'box_id': box_id
            })

    return lampu_list


def generate_sql(all_boxes, all_lampu):
    """Generate SQL file untuk database"""

    sql_content = """-- =====================================================
-- DATABASE PENERANGAN JALAN UMUM (PJU)
-- KABUPATEN KEDIRI - MULTI KECAMATAN
-- =====================================================

-- Buat database
CREATE DATABASE IF NOT EXISTS pju_kabupaten_kediri;
USE pju_kabupaten_kediri;

-- =====================================================
-- TABEL: KECAMATAN
-- =====================================================
DROP TABLE IF EXISTS kecamatan;
CREATE TABLE kecamatan (
    kecamatan_id INT PRIMARY KEY AUTO_INCREMENT,
    kecamatan_name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert data kecamatan
"""

    # Get unique kecamatan
    kecamatan_list = sorted(list(set(box['kecamatan'] for box in all_boxes)))
    for idx, kec in enumerate(kecamatan_list, 1):
        sql_content += f"INSERT INTO kecamatan (kecamatan_id, kecamatan_name) VALUES ({idx}, '{kec}');\n"

    sql_content += """
-- =====================================================
-- TABEL: BOX PANEL
-- =====================================================
DROP TABLE IF EXISTS box_panel;
CREATE TABLE box_panel (
    box_id INT PRIMARY KEY AUTO_INCREMENT,
    box_name VARCHAR(200) NOT NULL,
    kecamatan_id INT NOT NULL,
    desa VARCHAR(100),
    box_number VARCHAR(20),
    longitude DECIMAL(10, 7) NOT NULL,
    latitude DECIMAL(10, 7) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (kecamatan_id) REFERENCES kecamatan(kecamatan_id),
    INDEX idx_kecamatan (kecamatan_id),
    INDEX idx_desa (desa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

"""

    # Insert Box Panel
    sql_content += "\n-- Insert data Box Panel\n"
    kecamatan_id_map = {kec: idx + 1 for idx, kec in enumerate(kecamatan_list)}

    for idx, box in enumerate(all_boxes, 1):
        name_escaped = box['name'].replace("'", "''")
        kec_id = kecamatan_id_map[box['kecamatan']]
        box_num = box['box_number'] if box['box_number'] else 'NULL'
        if box_num != 'NULL':
            box_num = f"'{box_num}'"

        sql_content += f"""INSERT INTO box_panel (box_id, box_name, kecamatan_id, desa, box_number, longitude, latitude)
VALUES ({idx}, '{name_escaped}', {kec_id}, '{box['desa']}', {box_num}, {box['longitude']}, {box['latitude']});\n"""

    # Tabel Lampu PJU
    sql_content += """
-- =====================================================
-- TABEL: LAMPU PJU
-- =====================================================
DROP TABLE IF EXISTS lampu_pju;
CREATE TABLE lampu_pju (
    lampu_id INT PRIMARY KEY AUTO_INCREMENT,
    lampu_name VARCHAR(200) NOT NULL,
    kecamatan_id INT NOT NULL,
    desa VARCHAR(100) NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,
    latitude DECIMAL(10, 7) NOT NULL,
    lampu_type VARCHAR(50),
    jenis_jalan VARCHAR(20),
    box_id INT,
    status_koneksi ENUM('TERSAMBUNG', 'TIDAK TERSAMBUNG') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (kecamatan_id) REFERENCES kecamatan(kecamatan_id),
    FOREIGN KEY (box_id) REFERENCES box_panel(box_id) ON DELETE SET NULL,
    INDEX idx_kecamatan (kecamatan_id),
    INDEX idx_desa (desa),
    INDEX idx_status (status_koneksi),
    INDEX idx_box (box_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

"""

    # Insert Lampu PJU
    sql_content += "\n-- Insert data Lampu PJU\n"
    for idx, lampu in enumerate(all_lampu, 1):
        name_escaped = lampu['name'].replace("'", "''")
        kec_id = kecamatan_id_map[lampu['kecamatan']]
        box_id_value = str(lampu['box_id']) if lampu['box_id'] else 'NULL'
        status = 'TERSAMBUNG' if lampu['connected'] else 'TIDAK TERSAMBUNG'

        sql_content += f"""INSERT INTO lampu_pju (lampu_id, lampu_name, kecamatan_id, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES ({idx}, '{name_escaped}', {kec_id}, '{lampu['desa']}', {lampu['longitude']}, {lampu['latitude']}, '{lampu['lampu_type']}', '{lampu['jenis_jalan']}', {box_id_value}, '{status}');\n"""

    # Views dan Queries
    sql_content += """
-- =====================================================
-- VIEWS DAN QUERIES ANALISIS
-- =====================================================

-- View: Ringkasan per Kecamatan
CREATE OR REPLACE VIEW view_kecamatan_summary AS
SELECT
    k.kecamatan_name,
    COUNT(DISTINCT bp.box_id) as total_box,
    COUNT(DISTINCT lp.lampu_id) as total_lampu,
    SUM(CASE WHEN lp.status_koneksi = 'TERSAMBUNG' THEN 1 ELSE 0 END) as lampu_tersambung,
    SUM(CASE WHEN lp.status_koneksi = 'TIDAK TERSAMBUNG' THEN 1 ELSE 0 END) as lampu_tidak_tersambung,
    ROUND(SUM(CASE WHEN lp.status_koneksi = 'TERSAMBUNG' THEN 1 ELSE 0 END) * 100.0 / COUNT(lp.lampu_id), 2) as persentase_tersambung
FROM kecamatan k
LEFT JOIN box_panel bp ON k.kecamatan_id = bp.kecamatan_id
LEFT JOIN lampu_pju lp ON k.kecamatan_id = lp.kecamatan_id
GROUP BY k.kecamatan_name
ORDER BY total_lampu DESC;

-- View: Ringkasan per Box Panel
CREATE OR REPLACE VIEW view_box_summary AS
SELECT
    k.kecamatan_name,
    bp.box_id,
    bp.box_name,
    bp.desa,
    bp.longitude,
    bp.latitude,
    COUNT(lp.lampu_id) as total_lampu_tersambung
FROM box_panel bp
INNER JOIN kecamatan k ON bp.kecamatan_id = k.kecamatan_id
LEFT JOIN lampu_pju lp ON bp.box_id = lp.box_id AND lp.status_koneksi = 'TERSAMBUNG'
GROUP BY bp.box_id
ORDER BY k.kecamatan_name, bp.desa, bp.box_id;

-- View: Ringkasan per Desa
CREATE OR REPLACE VIEW view_desa_summary AS
SELECT
    k.kecamatan_name,
    lp.desa,
    COUNT(*) as total_lampu,
    SUM(CASE WHEN lp.status_koneksi = 'TERSAMBUNG' THEN 1 ELSE 0 END) as lampu_tersambung,
    SUM(CASE WHEN lp.status_koneksi = 'TIDAK TERSAMBUNG' THEN 1 ELSE 0 END) as lampu_tidak_tersambung,
    ROUND(SUM(CASE WHEN lp.status_koneksi = 'TERSAMBUNG' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as persentase_tersambung
FROM lampu_pju lp
INNER JOIN kecamatan k ON lp.kecamatan_id = k.kecamatan_id
GROUP BY k.kecamatan_name, lp.desa
ORDER BY k.kecamatan_name, total_lampu DESC;

-- View: Lampu Tidak Tersambung
CREATE OR REPLACE VIEW view_lampu_tidak_tersambung AS
SELECT
    k.kecamatan_name,
    lp.lampu_id,
    lp.lampu_name,
    lp.desa,
    lp.longitude,
    lp.latitude,
    lp.lampu_type,
    lp.jenis_jalan
FROM lampu_pju lp
INNER JOIN kecamatan k ON lp.kecamatan_id = k.kecamatan_id
WHERE lp.status_koneksi = 'TIDAK TERSAMBUNG'
ORDER BY k.kecamatan_name, lp.desa, lp.lampu_id;

-- =====================================================
-- STORED PROCEDURES
-- =====================================================

-- Procedure: Upload KML Baru
DELIMITER //
CREATE PROCEDURE sp_check_lampu_connection(
    IN p_lampu_name VARCHAR(200),
    IN p_desa VARCHAR(100),
    IN p_kecamatan VARCHAR(100)
)
BEGIN
    DECLARE v_box_id INT;
    DECLARE v_connected ENUM('TERSAMBUNG', 'TIDAK TERSAMBUNG');

    -- Extract box number from name
    -- Cari box yang match
    SELECT bp.box_id INTO v_box_id
    FROM box_panel bp
    INNER JOIN kecamatan k ON bp.kecamatan_id = k.kecamatan_id
    WHERE k.kecamatan_name = p_kecamatan
      AND bp.desa = p_desa
      AND p_lampu_name LIKE CONCAT('%', bp.box_number, '%')
    LIMIT 1;

    IF v_box_id IS NOT NULL THEN
        SET v_connected = 'TERSAMBUNG';
    ELSE
        SET v_connected = 'TIDAK TERSAMBUNG';
    END IF;

    SELECT v_box_id as box_id, v_connected as status_koneksi;
END //
DELIMITER ;

-- =====================================================
-- SUMMARY STATISTICS
-- =====================================================

-- Total keseluruhan
SELECT
    COUNT(DISTINCT k.kecamatan_id) as total_kecamatan,
    COUNT(DISTINCT bp.box_id) as total_box,
    COUNT(DISTINCT lp.lampu_id) as total_lampu,
    SUM(CASE WHEN lp.status_koneksi = 'TERSAMBUNG' THEN 1 ELSE 0 END) as lampu_tersambung,
    SUM(CASE WHEN lp.status_koneksi = 'TIDAK TERSAMBUNG' THEN 1 ELSE 0 END) as lampu_tidak_tersambung
FROM kecamatan k
LEFT JOIN box_panel bp ON k.kecamatan_id = bp.kecamatan_id
LEFT JOIN lampu_pju lp ON k.kecamatan_id = lp.kecamatan_id;

-- =====================================================
-- END OF SQL FILE
-- =====================================================
"""

    return sql_content


def process_kecamatan(kecamatan_name, config):
    """Process satu kecamatan"""
    print(f"\n{'='*60}")
    print(f"Kecamatan: {kecamatan_name}")
    print(f"{'='*60}")

    folder = config['folder']
    box_file = config['box_file']
    lampu_files = config['lampu_files']

    # Parse Box Panel
    box_path = os.path.join(folder, box_file)
    if not os.path.exists(box_path):
        print(f"  [SKIP] File box tidak ditemukan: {box_path}")
        return [], []

    print(f"\n1. Parsing Box Panel: {box_file}")
    boxes = parse_kml_boxes(box_path, kecamatan_name)
    print(f"   [OK] Ditemukan {len(boxes)} Box Panel")

    # Parse Lampu PJU
    all_lampu = []

    if not lampu_files:
        print(f"\n2. [INFO] Belum ada data lampu untuk {kecamatan_name}")
        return boxes, all_lampu

    print(f"\n2. Parsing Lampu PJU ({len(lampu_files)} file):")

    for filename in lampu_files:
        filepath = os.path.join(folder, filename)

        if os.path.exists(filepath):
            lampu_list = parse_kml_lampu(filepath, boxes, kecamatan_name)
            all_lampu.extend(lampu_list)

            connected = sum(1 for l in lampu_list if l['connected'])
            not_connected = len(lampu_list) - connected

            print(f"   [OK] {normalize_desa_name(filename)}: {len(lampu_list)} lampu "
                  f"({connected} tersambung, {not_connected} tidak tersambung)")
        else:
            print(f"   [SKIP] File tidak ditemukan: {filename}")

    return boxes, all_lampu


def main():
    print("=" * 60)
    print("ANALISIS PJU MULTI-KECAMATAN")
    print("Kabupaten Kediri")
    print("=" * 60)

    all_boxes = []
    all_lampu = []

    # Process setiap kecamatan
    for kec_name, config in KECAMATAN_CONFIG.items():
        boxes, lampu = process_kecamatan(kec_name, config)
        all_boxes.extend(boxes)
        all_lampu.extend(lampu)

    # Statistik Keseluruhan
    print(f"\n{'='*60}")
    print("STATISTIK KESELURUHAN")
    print(f"{'='*60}")

    total_connected = sum(1 for l in all_lampu if l['connected'])
    total_not_connected = len(all_lampu) - total_connected
    percentage = (total_connected / len(all_lampu) * 100) if all_lampu else 0

    print(f"Total Kecamatan: {len(KECAMATAN_CONFIG)}")
    print(f"Total Box Panel: {len(all_boxes)}")
    print(f"Total Lampu PJU: {len(all_lampu)}")
    print(f"Lampu Tersambung: {total_connected} ({percentage:.1f}%)")
    print(f"Lampu Tidak Tersambung: {total_not_connected} ({100-percentage:.1f}%)")

    # Per Kecamatan
    print(f"\nPer Kecamatan:")
    for kec_name in KECAMATAN_CONFIG.keys():
        kec_boxes = [b for b in all_boxes if b['kecamatan'] == kec_name]
        kec_lampu = [l for l in all_lampu if l['kecamatan'] == kec_name]
        kec_connected = sum(1 for l in kec_lampu if l['connected'])

        if kec_lampu:
            kec_percent = (kec_connected / len(kec_lampu) * 100)
            print(f"  - {kec_name}: {len(kec_boxes)} box, {len(kec_lampu)} lampu "
                  f"({kec_connected} tersambung, {kec_percent:.1f}%)")
        else:
            print(f"  - {kec_name}: {len(kec_boxes)} box, 0 lampu")

    # Generate SQL
    print(f"\n{'='*60}")
    print("GENERATE FILES")
    print(f"{'='*60}")

    print("\n1. Generate SQL Database...")
    sql_content = generate_sql(all_boxes, all_lampu)
    with open('pju_kabupaten_database.sql', 'w', encoding='utf-8') as f:
        f.write(sql_content)
    print("   [OK] File: pju_kabupaten_database.sql")

    # Generate JSON
    print("\n2. Generate JSON untuk visualisasi...")
    data_json = {
        'boxes': all_boxes,
        'lampu': all_lampu,
        'kecamatan': list(KECAMATAN_CONFIG.keys()),
        'statistics': {
            'total_kecamatan': len(KECAMATAN_CONFIG),
            'total_boxes': len(all_boxes),
            'total_lampu': len(all_lampu),
            'lampu_tersambung': total_connected,
            'lampu_tidak_tersambung': total_not_connected,
            'persentase_tersambung': round(percentage, 2)
        }
    }

    with open('pju_all_data.json', 'w', encoding='utf-8') as f:
        json.dump(data_json, f, ensure_ascii=False, indent=2)
    print("   [OK] File: pju_all_data.json")

    print(f"\n{'='*60}")
    print("SELESAI!")
    print(f"{'='*60}")
    print("\nFile yang dihasilkan:")
    print("  - pju_kabupaten_database.sql (Database SQL)")
    print("  - pju_all_data.json (Data untuk visualisasi web)")


if __name__ == '__main__':
    main()
