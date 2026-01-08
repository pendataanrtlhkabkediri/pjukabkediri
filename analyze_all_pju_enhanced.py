"""
Sistem Analisis PJU Multi-Kecamatan - ENHANCED VERSION
Kabupaten Kediri - 2025

Fitur Baru:
- Matching box panel menggunakan kombinasi "nama aset" dan "ruas jalan/desa"
- Setiap box dan lampunya punya warna unik (gradient colors)
- Warna kontras untuk box-box yang berdekatan
- Support 1000+ box panel dengan color mapping cerdas
"""

import xml.etree.ElementTree as ET
import re
import os
import json
import math
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
        'lampu_files': []
    }
}


def generate_contrasting_colors(num_colors):
    """
    Generate color palette dengan HSL untuk distribusi warna yang merata
    dan kontras untuk box-box yang berdekatan
    """
    colors = []

    # Gunakan golden angle untuk distribusi hue yang optimal
    golden_angle = 137.508  # degrees

    for i in range(num_colors):
        # Hue: distribusi merata dengan golden angle
        hue = (i * golden_angle) % 360

        # Saturation: variasi antara 65-95% untuk warna yang vibrant
        saturation = 65 + (i % 4) * 10

        # Lightness: variasi antara 45-65% untuk visibility
        lightness = 45 + (i % 3) * 10

        colors.append({
            'hsl': f'hsl({hue:.0f}, {saturation}%, {lightness}%)',
            'hue': hue,
            'saturation': saturation,
            'lightness': lightness
        })

    return colors


def hsl_to_hex(h, s, l):
    """Convert HSL to HEX color"""
    s = s / 100
    l = l / 100

    c = (1 - abs(2 * l - 1)) * s
    x = c * (1 - abs((h / 60) % 2 - 1))
    m = l - c / 2

    if 0 <= h < 60:
        r, g, b = c, x, 0
    elif 60 <= h < 120:
        r, g, b = x, c, 0
    elif 120 <= h < 180:
        r, g, b = 0, c, x
    elif 180 <= h < 240:
        r, g, b = 0, x, c
    elif 240 <= h < 300:
        r, g, b = x, 0, c
    else:
        r, g, b = c, 0, x

    r = int((r + m) * 255)
    g = int((g + m) * 255)
    b = int((b + m) * 255)

    return f'#{r:02x}{g:02x}{b:02x}'


def normalize_text(text):
    """Normalize text untuk matching (lowercase, remove extra spaces)"""
    if not text:
        return ""
    return re.sub(r'\s+', ' ', text.lower().strip())


def extract_box_info(text):
    """
    Extract box number dan desa dari text
    Returns: (box_number, desa_name)
    """
    if not text:
        return None, None

    text_norm = normalize_text(text)

    # Extract box number
    box_match = re.search(r'box\s*(\d+)', text_norm)
    box_number = box_match.group(1) if box_match else None

    # Extract desa name - lebih flexible
    desa_patterns = [
        r'desa\s+(\w+)',
        r'ds\.?\s+(\w+)',
    ]

    desa_name = None
    for pattern in desa_patterns:
        desa_match = re.search(pattern, text_norm)
        if desa_match:
            desa_name = desa_match.group(1)
            break

    return box_number, desa_name


def parse_kml_boxes(filepath, kecamatan_name):
    """Parse file KML Box Panel dengan ExtendedData"""
    tree = ET.parse(filepath)
    root = tree.getroot()

    boxes = []

    for placemark in root.findall('.//kml:Placemark', ns):
        name_elem = placemark.find('kml:name', ns)
        coords_elem = placemark.find('.//kml:coordinates', ns)

        if name_elem is not None and coords_elem is not None:
            name = name_elem.text.strip() if name_elem.text else ""
            coord_text = coords_elem.text.strip()

            try:
                lon, lat, *_ = coord_text.split(',')

                # Extract dari ExtendedData
                ruas_jalan_desa = ""
                for data in placemark.findall('.//kml:Data', ns):
                    data_name = data.get('name')
                    value = data.find('kml:value', ns)

                    if data_name == 'ruas jalan/ desa' and value is not None:
                        ruas_jalan_desa = value.text.strip() if value.text else ""
                        break

                # Prioritas: gunakan ruas jalan/desa jika ada, fallback ke name
                box_identifier = ruas_jalan_desa if ruas_jalan_desa else name

                # Extract box number dan desa
                box_number, desa = extract_box_info(box_identifier)

                # Create unique key
                if box_number and desa:
                    box_key = f"{desa}_box_{box_number}"
                    display_name = f"Box {box_number} Desa {desa.title()}"
                else:
                    box_key = normalize_text(box_identifier)
                    display_name = box_identifier

                boxes.append({
                    'original_name': name,
                    'name': display_name,
                    'box_identifier': box_identifier,
                    'kecamatan': kecamatan_name,
                    'desa': desa if desa else "Unknown",
                    'box_number': box_number,
                    'longitude': float(lon),
                    'latitude': float(lat),
                    'box_key': box_key,
                    'color': None  # Will be assigned later
                })
            except (ValueError, AttributeError) as e:
                continue

    return boxes


def check_lamp_box_connection(lamp_text, box):
    """
    Check apakah lampu terhubung dengan box
    Matching lebih flexible: box number + desa name
    """
    if not lamp_text or not box:
        return False

    lamp_norm = normalize_text(lamp_text)
    box_number = box.get('box_number')
    desa = box.get('desa')

    if not box_number or not desa:
        return False

    desa_norm = normalize_text(desa)

    # Check 1: Ada "box [number]" dan nama desa yang sama
    has_box_number = f"box {box_number}" in lamp_norm or f"box{box_number}" in lamp_norm
    has_desa = desa_norm in lamp_norm

    if has_box_number and has_desa:
        return True

    # Check 2: Exact match dengan box_identifier
    box_id_norm = normalize_text(box.get('box_identifier', ''))
    if box_id_norm and box_id_norm in lamp_norm:
        return True

    return False


def parse_kml_lampu(filepath, boxes, kecamatan_name):
    """Parse file KML lampu PJU dengan matching yang lebih baik"""
    tree = ET.parse(filepath)
    root = tree.getroot()

    # Extract desa name from filename
    filename = os.path.basename(filepath)
    desa_from_file = normalize_text(filename)
    desa_from_file = re.sub(r'(desa|ds\.?|kec\.?|kecamatan|\.csv|\.kml)', '', desa_from_file)
    desa_from_file = desa_from_file.strip()

    lampu_list = []

    for placemark in root.findall('.//kml:Placemark', ns):
        name_elem = placemark.find('kml:name', ns)
        coords_elem = placemark.find('.//kml:coordinates', ns)

        if name_elem is not None and coords_elem is not None:
            name = name_elem.text.strip() if name_elem.text else ""
            coord_text = coords_elem.text.strip()

            try:
                lon, lat, *_ = coord_text.split(',')
            except ValueError:
                continue

            # Extract ExtendedData
            nama_aset = ""
            lampu_type = ""
            jenis_jalan = ""

            for data in placemark.findall('.//kml:Data', ns):
                data_name = data.get('name')
                value = data.find('kml:value', ns)

                if value is not None and value.text:
                    value_text = value.text.strip()
                    if data_name == 'nama aset':
                        nama_aset = value_text
                    elif data_name == 'lampu':
                        lampu_type = value_text
                    elif data_name == 'Jenis Jalan':
                        jenis_jalan = value_text

            # Prioritas matching: nama aset > name
            match_text = nama_aset if nama_aset else name

            # Check connection dengan semua box
            connected = False
            box_id = None
            matched_box = None

            for idx, box in enumerate(boxes):
                if check_lamp_box_connection(match_text, box):
                    connected = True
                    box_id = idx + 1
                    matched_box = box
                    break

            lampu_list.append({
                'name': name,
                'nama_aset': nama_aset,
                'kecamatan': kecamatan_name,
                'desa': desa_from_file,
                'longitude': float(lon),
                'latitude': float(lat),
                'lampu_type': lampu_type,
                'jenis_jalan': jenis_jalan,
                'box_name': matched_box['name'] if matched_box else 'TIDAK TERSAMBUNG',
                'box_key': matched_box['box_key'] if matched_box else None,
                'connected': connected,
                'box_id': box_id,
                'color': matched_box['color'] if matched_box else None
            })

    return lampu_list


def generate_sql(all_boxes, all_lampu):
    """Generate SQL file untuk database dengan color information"""

    sql_content = """-- =====================================================
-- DATABASE PENERANGAN JALAN UMUM (PJU)
-- KABUPATEN KEDIRI - MULTI KECAMATAN
-- VERSION 2.0 - WITH COLOR CODING
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
    original_name VARCHAR(200),
    box_identifier VARCHAR(200),
    kecamatan_id INT NOT NULL,
    desa VARCHAR(100),
    box_number VARCHAR(20),
    longitude DECIMAL(10, 7) NOT NULL,
    latitude DECIMAL(10, 7) NOT NULL,
    color_hex VARCHAR(7),
    color_hsl VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (kecamatan_id) REFERENCES kecamatan(kecamatan_id),
    INDEX idx_kecamatan (kecamatan_id),
    INDEX idx_desa (desa),
    INDEX idx_box_key (desa, box_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

"""

    # Insert Box Panel
    sql_content += "\n-- Insert data Box Panel\n"
    kecamatan_id_map = {kec: idx + 1 for idx, kec in enumerate(kecamatan_list)}

    for idx, box in enumerate(all_boxes, 1):
        name_escaped = box['name'].replace("'", "''")
        original_escaped = box['original_name'].replace("'", "''")
        identifier_escaped = box['box_identifier'].replace("'", "''")
        kec_id = kecamatan_id_map[box['kecamatan']]
        box_num = box['box_number'] if box['box_number'] else 'NULL'
        if box_num != 'NULL':
            box_num = f"'{box_num}'"

        color_hex = box.get('color_hex', '')
        color_hsl = box.get('color_hsl', '')

        sql_content += f"""INSERT INTO box_panel (box_id, box_name, original_name, box_identifier, kecamatan_id, desa, box_number, longitude, latitude, color_hex, color_hsl)
VALUES ({idx}, '{name_escaped}', '{original_escaped}', '{identifier_escaped}', {kec_id}, '{box['desa']}', {box_num}, {box['longitude']}, {box['latitude']}, '{color_hex}', '{color_hsl}');\n"""

    # Tabel Lampu PJU
    sql_content += """
-- =====================================================
-- TABEL: LAMPU PJU
-- =====================================================
DROP TABLE IF EXISTS lampu_pju;
CREATE TABLE lampu_pju (
    lampu_id INT PRIMARY KEY AUTO_INCREMENT,
    lampu_name VARCHAR(200) NOT NULL,
    nama_aset VARCHAR(200),
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
        nama_aset_escaped = lampu['nama_aset'].replace("'", "''") if lampu['nama_aset'] else ''
        kec_id = kecamatan_id_map[lampu['kecamatan']]
        box_id_value = str(lampu['box_id']) if lampu['box_id'] else 'NULL'
        status = 'TERSAMBUNG' if lampu['connected'] else 'TIDAK TERSAMBUNG'

        sql_content += f"""INSERT INTO lampu_pju (lampu_id, lampu_name, nama_aset, kecamatan_id, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES ({idx}, '{name_escaped}', '{nama_aset_escaped}', {kec_id}, '{lampu['desa']}', {lampu['longitude']}, {lampu['latitude']}, '{lampu['lampu_type']}', '{lampu['jenis_jalan']}', {box_id_value}, '{status}');\n"""

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
    ROUND(SUM(CASE WHEN lp.status_koneksi = 'TERSAMBUNG' THEN 1 ELSE 0 END) * 100.0 / NULLIF(COUNT(lp.lampu_id), 0), 2) as persentase_tersambung
FROM kecamatan k
LEFT JOIN box_panel bp ON k.kecamatan_id = bp.kecamatan_id
LEFT JOIN lampu_pju lp ON k.kecamatan_id = lp.kecamatan_id
GROUP BY k.kecamatan_name
ORDER BY total_lampu DESC;

-- View: Ringkasan per Box Panel (with color)
CREATE OR REPLACE VIEW view_box_summary AS
SELECT
    k.kecamatan_name,
    bp.box_id,
    bp.box_name,
    bp.desa,
    bp.box_number,
    bp.longitude,
    bp.latitude,
    bp.color_hex,
    bp.color_hsl,
    COUNT(lp.lampu_id) as total_lampu_tersambung
FROM box_panel bp
INNER JOIN kecamatan k ON bp.kecamatan_id = k.kecamatan_id
LEFT JOIN lampu_pju lp ON bp.box_id = lp.box_id AND lp.status_koneksi = 'TERSAMBUNG'
GROUP BY bp.box_id
ORDER BY k.kecamatan_name, bp.desa, bp.box_number;

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
    lp.nama_aset,
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

            # Extract desa name for display
            desa_display = os.path.basename(filename).replace('.csv.kml', '')

            print(f"   [OK] {desa_display}: {len(lampu_list)} lampu "
                  f"({connected} tersambung, {not_connected} tidak tersambung)")
        else:
            print(f"   [SKIP] File tidak ditemukan: {filename}")

    return boxes, all_lampu


def main():
    print("=" * 60)
    print("ANALISIS PJU MULTI-KECAMATAN - ENHANCED")
    print("Kabupaten Kediri")
    print("=" * 60)

    all_boxes = []
    all_lampu = []

    # Process setiap kecamatan
    for kec_name, config in KECAMATAN_CONFIG.items():
        boxes, lampu = process_kecamatan(kec_name, config)
        all_boxes.extend(boxes)
        all_lampu.extend(lampu)

    # Generate colors untuk semua boxes
    print(f"\n{'='*60}")
    print("GENERATE COLOR PALETTE")
    print(f"{'='*60}")

    num_boxes = len(all_boxes)
    colors = generate_contrasting_colors(num_boxes)

    print(f"Generated {num_boxes} unique colors with optimal contrast")

    # Assign colors to boxes
    for idx, box in enumerate(all_boxes):
        color_info = colors[idx]
        box['color'] = color_info['hsl']
        box['color_hsl'] = color_info['hsl']
        box['color_hex'] = hsl_to_hex(color_info['hue'], color_info['saturation'], color_info['lightness'])

    # Update lamp colors based on connected box
    for lampu in all_lampu:
        if lampu['connected'] and lampu['box_id']:
            box_idx = lampu['box_id'] - 1
            if 0 <= box_idx < len(all_boxes):
                lampu['color'] = all_boxes[box_idx]['color']
                lampu['color_hex'] = all_boxes[box_idx]['color_hex']

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
    print("  - pju_kabupaten_database.sql (Database SQL with colors)")
    print("  - pju_all_data.json (Data untuk visualisasi web with colors)")
    print("\nPerbaikan:")
    print("  [+] Box matching menggunakan 'ruas jalan/desa' + 'nama aset'")
    print("  [+] Setiap box punya warna unik (HSL color space)")
    print(f"  [+] {num_boxes} warna dengan kontras optimal untuk box berdekatan")
    print("  [+] Lampu mengikuti warna box yang terhubung")


if __name__ == '__main__':
    main()
