-- =====================================================
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


-- Insert data Box Panel
INSERT INTO box_panel (box_id, box_name, longitude, latitude) VALUES (1, 'Desa Tengger Lor Box 1', 112.17591, -7.6624);
INSERT INTO box_panel (box_id, box_name, longitude, latitude) VALUES (2, 'Desa Wonorejo Box 1', 112.18664, -7.6692);
INSERT INTO box_panel (box_id, box_name, longitude, latitude) VALUES (3, 'Desa Kapi Box 1', 112.162716, -7.6572613);
INSERT INTO box_panel (box_id, box_name, longitude, latitude) VALUES (4, 'Desa Kunjang Box 1', 112.1575915, -7.6551586);
INSERT INTO box_panel (box_id, box_name, longitude, latitude) VALUES (5, 'Desa Pakis Box 1', 112.1709713, -7.6408234);
INSERT INTO box_panel (box_id, box_name, longitude, latitude) VALUES (6, 'Desa Juwet Box 1', 112.1828056, -7.6523889);
INSERT INTO box_panel (box_id, box_name, longitude, latitude) VALUES (7, 'Desa Balongjeruk Box 1', 112.1917222, -7.6742222);
INSERT INTO box_panel (box_id, box_name, longitude, latitude) VALUES (8, 'Desa Juwet Box 2', 112.1908056, -7.6505833);

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


-- Insert data Lampu PJU
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18627, -7.68825, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (2, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18601, -7.6881, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (3, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18569, -7.68793, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (4, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18533, -7.68774, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (5, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.185, -7.68756, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (6, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18462, -7.68735, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (7, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18418, -7.68711, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (8, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18642, -7.688, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (9, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18668, -7.6873, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (10, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18695, -7.68659, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (11, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18742, -7.68537, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (12, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18764, -7.68482, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (13, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.1879, -7.68413, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (14, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18814, -7.68351, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (15, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.1883, -7.68308, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (16, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18851, -7.68255, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (17, 'ASET DESA LEGAL', 'DESA BALONGJERUK KEC KUNJANG', 112.18879, -7.68185, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (18, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1891, -7.68134, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (19, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18954, -7.68073, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (20, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1897, -7.68021, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (21, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18986, -7.67969, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (22, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19, -7.67988, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (23, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19002, -7.67989, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (24, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18995, -7.67889, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (25, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19024, -7.67866, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (26, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19043, -7.67876, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (27, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19072, -7.6789, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (28, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19079, -7.67893, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (29, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19117, -7.67909, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (30, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19139, -7.67918, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (31, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19146, -7.67922, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (32, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1916, -7.67928, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (33, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19192, -7.67942, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (34, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19198, -7.67964, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (35, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19193, -7.67974, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (36, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19187, -7.67991, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (37, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19226, -7.68002, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (38, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19165, -7.67985, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (39, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19146, -7.67979, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (40, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19139, -7.67976, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (41, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19125, -7.67972, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (42, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19111, -7.67967, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (43, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19095, -7.67962, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (44, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19071, -7.67954, 'LED', '', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (45, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19002, -7.67858, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (46, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19013, -7.6783, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (47, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19023, -7.67802, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (48, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19029, -7.67784, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (49, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19028, -7.67782, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (50, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19005, -7.67774, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (51, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18979, -7.67764, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (52, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18973, -7.67762, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (53, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18961, -7.67757, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (54, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18923, -7.67744, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (55, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18889, -7.67733, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (56, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18882, -7.67731, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (57, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18861, -7.67724, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (58, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18826, -7.67716, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (59, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18805, -7.67713, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (60, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18774, -7.67706, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (61, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18756, -7.6775, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (62, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18753, -7.67764, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (63, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18755, -7.67776, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (64, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18773, -7.67779, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (65, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18786, -7.67793, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (66, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18781, -7.67819, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (67, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18778, -7.67839, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (68, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18775, -7.67856, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (69, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18808, -7.67875, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (70, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18817, -7.67878, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (71, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18768, -7.67883, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (72, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18791, -7.67757, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (73, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18796, -7.67727, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (74, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19037, -7.67768, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (75, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19051, -7.67733, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (76, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19069, -7.67685, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (77, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19082, -7.67649, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (78, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19096, -7.67612, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (79, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19109, -7.67576, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (80, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19126, -7.67533, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (81, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19143, -7.67489, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (82, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19149, -7.67473, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (83, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19154, -7.67458, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (84, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19173, -7.67428, 'MERCURY', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (85, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19183, -7.67432, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (86, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.1922, -7.67476, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (87, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19244, -7.67506, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (88, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.1925, -7.67512, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (89, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1926, -7.67525, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (90, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.1928, -7.67549, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (91, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.1931, -7.67586, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (92, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19356, -7.6764, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (93, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19397, -7.67692, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (94, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19408, -7.67706, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (95, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19431, -7.67733, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (96, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19463, -7.67771, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (97, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.1949, -7.67806, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (98, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19443, -7.67668, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (99, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1944, -7.67669, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (100, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19417, -7.67692, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (101, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19462, -7.67646, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (102, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19472, -7.67634, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (103, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1951, -7.67566, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (104, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19521, -7.67547, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (105, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19527, -7.67536, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (106, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19505, -7.67526, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (107, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19486, -7.67518, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (108, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19451, -7.67504, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (109, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19443, -7.675, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (110, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19435, -7.67496, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (111, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19431, -7.67494, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (112, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19417, -7.67487, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (113, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19406, -7.67481, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (114, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1938, -7.6747, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (115, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19375, -7.67468, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (116, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19342, -7.67452, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (117, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19329, -7.67446, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (118, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19312, -7.67439, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (119, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19296, -7.6743, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (120, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19278, -7.67422, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (121, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19264, -7.67425, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (122, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19258, -7.67442, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (123, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19266, -7.67459, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (124, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19293, -7.67474, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (125, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19307, -7.67482, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (126, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19318, -7.67489, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (127, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1935, -7.67504, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (128, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19359, -7.67511, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (129, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19375, -7.6752, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (130, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19385, -7.67527, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (131, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19394, -7.67533, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (132, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19404, -7.6754, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (133, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19422, -7.67549, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (134, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19435, -7.67557, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (135, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19445, -7.67562, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (136, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19469, -7.67576, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (137, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1951, -7.67497, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (138, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19522, -7.67461, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (139, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19508, -7.6745, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (140, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19492, -7.67443, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (141, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19476, -7.67437, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (142, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19458, -7.6743, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (143, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19449, -7.67427, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (144, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19433, -7.6742, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (145, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19416, -7.67412, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (146, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.194, -7.67405, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (147, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19383, -7.67397, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (148, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1935, -7.67384, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (149, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19323, -7.67374, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (150, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19303, -7.67364, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (151, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19288, -7.67378, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (152, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19278, -7.67394, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (153, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19289, -7.67356, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (154, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19268, -7.67349, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (155, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19248, -7.6734, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (156, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19226, -7.67331, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (157, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19222, -7.67326, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (158, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19206, -7.6731, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (159, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19177, -7.67299, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (160, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19172, -7.67308, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (161, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19164, -7.67336, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (162, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19154, -7.67375, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (163, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19164, -7.67292, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (164, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1912, -7.67336, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (165, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1912, -7.67336, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (166, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1912, -7.67311, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (167, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19121, -7.67307, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (168, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19124, -7.67292, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (169, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19131, -7.67262, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (170, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19132, -7.67248, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (171, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19134, -7.67217, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (172, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19131, -7.67197, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (173, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19128, -7.67171, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (174, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19124, -7.67144, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (175, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19119, -7.67111, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (176, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19117, -7.67093, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (177, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19112, -7.67053, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (178, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19111, -7.67046, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (179, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19106, -7.67009, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (180, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19104, -7.66994, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (181, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19098, -7.66946, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (182, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19134, -7.67189, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (183, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19136, -7.6719, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (184, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19141, -7.6719, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (185, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19147, -7.67188, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (186, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19149, -7.67187, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (187, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1915, -7.67185, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (188, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19152, -7.67181, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (189, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19153, -7.67182, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (190, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19122, -7.67356, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (191, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19154, -7.67394, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (192, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19114, -7.6735, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (193, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19098, -7.67331, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (194, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19083, -7.67314, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (195, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19046, -7.6727, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (196, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.19041, -7.67264, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (197, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19036, -7.67258, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (198, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.19017, -7.67235, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (199, 'Desa Balongjeruk Box 1 Aset Perkim', 'DESA BALONGJERUK KEC KUNJANG', 112.1899, -7.672, 'LED', 'K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (200, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18906, -7.67283, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (201, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18895, -7.67302, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (202, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18888, -7.67315, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (203, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18881, -7.67328, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (204, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18869, -7.67356, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (205, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18841, -7.67374, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (206, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18809, -7.67371, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (207, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1878, -7.67367, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (208, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18766, -7.67363, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (209, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18724, -7.6735, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (210, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18654, -7.67323, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (211, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18634, -7.67315, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (212, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18615, -7.67311, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (213, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.186, -7.67306, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (214, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18576, -7.67296, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (215, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18568, -7.6729, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (216, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18582, -7.67253, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (217, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1859, -7.67233, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (218, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18642, -7.67347, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (219, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18639, -7.67364, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (220, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18633, -7.67391, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (221, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18601, -7.67403, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (222, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.186, -7.67406, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (223, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18597, -7.67415, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (224, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1859, -7.67431, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (225, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.1867, -7.67405, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (226, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18711, -7.67408, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (227, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18716, -7.67408, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (228, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18737, -7.6741, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (229, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18768, -7.67411, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (230, 'Desa Balongjeruk Box 1 Aset Desa', 'DESA BALONGJERUK KEC KUNJANG', 112.18773, -7.67402, 'LED', 'NON K1', 7, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (231, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17614, -7.64268, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (232, 'Stang 3M', 'DESA JUWET KEC KUNJANG', 112.17625, -7.64281, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (233, 'Stang 3M', 'DESA JUWET KEC KUNJANG', 112.17713, -7.64318, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (234, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17748, -7.6433, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (235, 'Stang 3M', 'DESA JUWET KEC KUNJANG', 112.17764, -7.64336, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (236, 'Stang 3M', 'DESA JUWET KEC KUNJANG', 112.17805, -7.6435, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (237, 'Stang 3M', 'DESA JUWET KEC KUNJANG', 112.17855, -7.64368, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (238, 'Stang 3M', 'DESA JUWET KEC KUNJANG', 112.1791, -7.64387, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (239, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17932, -7.64395, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (240, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17947, -7.64374, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (241, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17951, -7.64356, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (242, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17959, -7.64326, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (243, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17962, -7.64306, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (244, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17967, -7.64266, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (245, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17968, -7.64259, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (246, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.1798, -7.6424, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (247, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17984, -7.64216, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (248, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17986, -7.64195, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (249, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18, -7.64158, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (250, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18011, -7.64128, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (251, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18021, -7.641, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (252, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18028, -7.64082, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (253, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18045, -7.64074, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (254, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18068, -7.64085, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (255, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18088, -7.64094, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (256, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18101, -7.64101, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (257, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18123, -7.6411, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (258, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18126, -7.64111, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (259, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18128, -7.64112, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (260, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18128, -7.64113, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (261, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18029, -7.64084, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (262, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17932, -7.6426, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (263, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17923, -7.64255, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (264, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17911, -7.64269, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (265, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17897, -7.6432, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (266, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17899, -7.64323, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (267, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.179, -7.64348, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (268, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17892, -7.64373, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (269, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17822, -7.64342, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (270, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17834, -7.64305, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (271, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17867, -7.64312, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (272, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17875, -7.64315, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (273, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17892, -7.64241, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (274, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17857, -7.64234, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (275, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17844, -7.64266, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (276, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17795, -7.64289, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (277, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17762, -7.64279, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (278, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17731, -7.64271, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (279, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17713, -7.64265, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (280, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.1769, -7.64257, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (281, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17675, -7.64261, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (282, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17672, -7.64272, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (283, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17666, -7.64294, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (284, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17686, -7.64241, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (285, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17693, -7.64222, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (286, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17701, -7.64201, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (287, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17708, -7.64178, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (288, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17722, -7.64178, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (289, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.1775, -7.64187, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (290, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17769, -7.64196, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (291, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17758, -7.64228, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (292, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17756, -7.64234, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (293, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17751, -7.64245, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (294, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17789, -7.64202, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (295, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17817, -7.64212, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (296, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17838, -7.64221, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (297, 'Stang 3M', 'DESA JUWET KEC KUNJANG', 112.1791, -7.64416, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (298, 'Stang 3M', 'DESA JUWET KEC KUNJANG', 112.1789, -7.64478, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (299, 'Stang 3M', 'DESA JUWET KEC KUNJANG', 112.17874, -7.64539, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (300, 'Stang 6M', 'DESA JUWET KEC KUNJANG', 112.17859, -7.64588, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (301, 'Stang 6M', 'DESA JUWET KEC KUNJANG', 112.17832, -7.64674, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (302, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17822, -7.64694, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (303, 'Stang 6M', 'DESA JUWET KEC KUNJANG', 112.17843, -7.647, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (304, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17843, -7.647, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (305, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17863, -7.6471, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (306, 'Stang 6M', 'DESA JUWET KEC KUNJANG', 112.17889, -7.64721, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (307, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17894, -7.64724, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (308, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17912, -7.64732, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (309, 'Stang 6M', 'DESA JUWET KEC KUNJANG', 112.17918, -7.64735, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (310, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17945, -7.64759, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (311, 'Stang 6M', 'DESA JUWET KEC KUNJANG', 112.17944, -7.64769, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (312, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17927, -7.64809, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (313, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.17938, -7.64824, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (314, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17978, -7.6484, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (315, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18015, -7.64857, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (316, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.18045, -7.6487, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (317, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.18077, -7.64883, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (318, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.18115, -7.64899, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (319, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.18158, -7.64916, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (320, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18173, -7.64921, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (321, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18185, -7.64899, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (322, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18192, -7.64877, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (323, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18201, -7.64854, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (324, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18228, -7.64855, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (325, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18242, -7.64857, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (326, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18253, -7.64835, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (327, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18263, -7.64809, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (328, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18226, -7.64778, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (329, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18187, -7.64758, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (330, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18149, -7.64736, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (331, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18116, -7.64717, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (332, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18079, -7.64696, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (333, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18032, -7.64669, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (334, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17993, -7.64648, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (335, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17995, -7.64629, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (336, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18005, -7.6461, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (337, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17982, -7.64664, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (338, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17976, -7.64678, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (339, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17967, -7.64698, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (340, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.17961, -7.64733, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (341, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18, -7.64752, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (342, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18032, -7.64767, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (343, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18068, -7.64783, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (344, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.18093, -7.64795, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (345, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.18145, -7.64819, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (346, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18175, -7.64832, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (347, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18192, -7.64932, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (348, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.18204, -7.64937, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (349, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.18247, -7.64954, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (350, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.18255, -7.64956, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (351, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18316, -7.6498, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (352, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18348, -7.64994, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (353, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18371, -7.65002, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (354, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.1838, -7.64989, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (355, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18392, -7.64952, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (356, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18404, -7.64922, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (357, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18389, -7.65011, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (358, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18403, -7.65017, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (359, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18411, -7.6502, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (360, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18444, -7.65032, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (361, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18488, -7.6505, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (362, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18509, -7.65058, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (363, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18506, -7.65102, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (364, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18499, -7.65122, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (365, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18489, -7.6515, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (366, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18477, -7.65183, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (367, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18467, -7.65212, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (368, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.1845, -7.65258, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (369, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18442, -7.65279, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (370, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18429, -7.65305, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (371, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18446, -7.65326, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (372, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18464, -7.65337, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (373, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18472, -7.65341, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (374, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18485, -7.65351, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (375, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18503, -7.65367, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (376, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18522, -7.65387, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (377, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18535, -7.65396, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (378, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18552, -7.65409, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (379, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18579, -7.65429, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (380, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18594, -7.65439, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (381, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18512, -7.65412, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (382, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18429, -7.65253, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (383, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18393, -7.65237, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (384, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18349, -7.65217, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (385, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18324, -7.65208, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (386, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18293, -7.65214, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (387, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18296, -7.65198, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (388, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18278, -7.65184, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (389, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.1824, -7.65172, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (390, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18205, -7.65158, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (391, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18177, -7.65144, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (392, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18177, -7.65141, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (393, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18197, -7.65098, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (394, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18206, -7.65066, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (395, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18191, -7.65058, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (396, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.1817, -7.65048, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (397, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18222, -7.65037, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (398, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18233, -7.65007, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (399, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18239, -7.65083, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (400, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18269, -7.65097, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (401, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18292, -7.65108, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (402, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18324, -7.65121, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (403, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18348, -7.65074, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (404, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18357, -7.65051, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (405, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18352, -7.65138, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (406, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18394, -7.65157, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (407, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18408, -7.65164, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (408, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18447, -7.65182, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (409, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18317, -7.65138, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (410, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18278, -7.65259, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (411, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18272, -7.65234, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (412, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18165, -7.65185, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (413, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18211, -7.65207, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (414, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18298, -7.65248, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (415, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18329, -7.65261, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (416, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18367, -7.6528, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (417, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18403, -7.65314, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (418, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18437, -7.65352, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (419, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18423, -7.65413, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (420, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18404, -7.65454, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (421, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18388, -7.65491, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (422, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18375, -7.65516, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (423, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18374, -7.65518, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (424, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18373, -7.6552, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (425, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18372, -7.65522, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (426, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18371, -7.65525, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (427, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18372, -7.65526, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (428, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18373, -7.65528, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (429, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18377, -7.65528, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (430, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18468, -7.65398, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (431, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18494, -7.65435, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (432, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18524, -7.65467, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (433, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18537, -7.65481, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (434, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18558, -7.65505, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (435, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18581, -7.65531, 'LED', 'K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (436, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18607, -7.65482, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (437, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18609, -7.65477, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (438, 'Desa Juwet Box 1 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.18621, -7.65444, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (439, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18599, -7.65554, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (440, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18623, -7.65581, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (441, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18643, -7.65604, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (442, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18658, -7.6562, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (443, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18682, -7.65647, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (444, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18707, -7.65675, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (445, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18732, -7.65704, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (446, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18764, -7.65745, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (447, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18779, -7.65767, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (448, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18794, -7.65789, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (449, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18817, -7.65819, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (450, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18847, -7.6586, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (451, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18879, -7.65903, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (452, 'Desa Juwet Box 1 Aset Perkim', 'DESA JUWET KEC KUNJANG', 112.18892, -7.65921, 'LED', 'NON K1', 6, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (453, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18888, -7.65923, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (454, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.1885, -7.65786, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (455, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18873, -7.65738, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (456, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18884, -7.6571, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (457, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18895, -7.65681, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (458, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18909, -7.65649, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (459, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18922, -7.65616, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (460, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18934, -7.65585, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (461, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18943, -7.6556, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (462, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18953, -7.65536, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (463, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18959, -7.65518, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (464, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.1897, -7.65489, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (465, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18979, -7.65469, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (466, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18992, -7.65435, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (467, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19006, -7.65375, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (468, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19011, -7.65351, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (469, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19017, -7.65326, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (470, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19023, -7.653, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (471, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19029, -7.65275, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (472, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19038, -7.6524, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (473, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19044, -7.6521, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (474, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.1905, -7.6519, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (475, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19055, -7.65169, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (476, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19063, -7.65135, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (477, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19074, -7.65095, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (478, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19082, -7.65064, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (479, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19088, -7.6504, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (480, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19095, -7.65013, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (481, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19102, -7.64979, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (482, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19115, -7.64924, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (483, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19124, -7.64895, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (484, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19136, -7.64861, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (485, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19146, -7.64865, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (486, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19172, -7.64874, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (487, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19204, -7.64883, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (488, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19168, -7.64937, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (489, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19158, -7.64934, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (490, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19138, -7.64927, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (491, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19196, -7.64956, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (492, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.1919, -7.64978, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (493, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19197, -7.65012, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (494, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19178, -7.65008, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (495, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19168, -7.65004, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (496, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19143, -7.64998, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (497, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.1913, -7.64994, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (498, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19114, -7.64989, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (499, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19103, -7.65069, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (500, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19136, -7.65078, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (501, 'Desa Juwet Box 2 Aset Desa', 'DESA JUWET KEC KUNJANG', 112.19174, -7.65092, 'LED', 'NON K1', 8, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (502, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18958, -7.65537, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (503, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.18993, -7.6555, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (504, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.1902, -7.65561, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (505, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19048, -7.65573, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (506, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19067, -7.65583, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (507, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19073, -7.65586, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (508, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.1908, -7.65589, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (509, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.1908, -7.65589, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (510, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19086, -7.65591, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (511, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19092, -7.65594, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (512, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19118, -7.65605, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (513, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19145, -7.65617, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (514, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19159, -7.65624, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (515, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.1918, -7.65632, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (516, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19194, -7.65639, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (517, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19213, -7.65648, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (518, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19246, -7.65663, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (519, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.1927, -7.65672, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (520, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19284, -7.65678, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (521, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.193, -7.65686, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (522, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19317, -7.65694, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (523, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19335, -7.65702, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (524, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19348, -7.65707, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (525, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19362, -7.65714, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (526, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19301, -7.65728, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (527, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19287, -7.65774, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (528, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19281, -7.65792, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (529, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.1929, -7.6563, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (530, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19294, -7.65614, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (531, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19344, -7.65633, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (532, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19336, -7.65631, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (533, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19304, -7.65596, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (534, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.1932, -7.65556, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (535, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19332, -7.65537, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (536, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19356, -7.65546, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (537, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19333, -7.65507, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (538, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19341, -7.65482, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (539, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19351, -7.6545, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (540, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19366, -7.65407, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (541, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19377, -7.65375, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (542, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19391, -7.6534, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (543, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19408, -7.65293, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (544, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.1942, -7.65263, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (545, 'ASET DESA LEGAL', 'DESA JUWET KEC KUNJANG', 112.19425, -7.65231, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (546, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.19412, -7.65223, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (547, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.19401, -7.65218, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (548, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.19362, -7.65198, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (549, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.19336, -7.65185, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (550, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.19312, -7.65171, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (551, 'ASET DESA ILEGAL', 'DESA JUWET KEC KUNJANG', 112.19257, -7.65136, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (552, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15808, -7.66945, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (553, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1581, -7.66929, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (554, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1582, -7.66886, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (555, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15845, -7.66772, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (556, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15852, -7.66741, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (557, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15867, -7.66683, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (558, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1588, -7.66634, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (559, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15865, -7.66591, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (560, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1583, -7.66583, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (561, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15908, -7.6659, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (562, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15915, -7.66568, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (563, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15925, -7.66568, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (564, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15942, -7.66574, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (565, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15967, -7.66581, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (566, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15985, -7.66586, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (567, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16009, -7.6659, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (568, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16026, -7.66607, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (569, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16036, -7.66606, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (570, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15918, -7.66551, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (571, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1593, -7.66526, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (572, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15943, -7.6653, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (573, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15959, -7.66534, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (574, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15961, -7.66537, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (575, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15931, -7.66509, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (576, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15934, -7.66499, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (577, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15926, -7.66474, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (578, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15914, -7.66471, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (579, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1589, -7.66466, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (580, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15869, -7.6646, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (581, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15855, -7.66456, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (582, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1584, -7.66452, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (583, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15826, -7.66447, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (584, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15809, -7.66442, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (585, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15794, -7.66438, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (586, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15769, -7.66431, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (587, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15752, -7.66428, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (588, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15737, -7.66424, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (589, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1573, -7.66422, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (590, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15715, -7.66419, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (591, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.157, -7.66414, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (592, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15696, -7.664, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (593, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15701, -7.66387, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (594, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15881, -7.66473, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (595, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1588, -7.66488, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (596, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15878, -7.665, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (597, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15875, -7.6652, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (598, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15871, -7.66534, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (599, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15868, -7.66534, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (600, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15849, -7.6653, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (601, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15834, -7.66526, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (602, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15829, -7.66525, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (603, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15808, -7.66521, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (604, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.158, -7.6652, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (605, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15791, -7.66518, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (606, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15782, -7.66517, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (607, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15767, -7.66513, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (608, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15738, -7.66507, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (609, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15727, -7.66505, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (610, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15709, -7.66501, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (611, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15696, -7.66498, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (612, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15936, -7.66473, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (613, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15947, -7.66446, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (614, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15949, -7.66433, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (615, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15953, -7.6641, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (616, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15954, -7.66406, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (617, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15972, -7.66403, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (618, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1599, -7.66408, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (619, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16023, -7.66416, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (620, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16077, -7.66429, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (621, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16116, -7.66439, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (622, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16168, -7.66452, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (623, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16177, -7.66455, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (624, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16183, -7.66457, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (625, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16185, -7.66459, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (626, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16178, -7.66456, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (627, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15954, -7.66395, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (628, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15956, -7.66366, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (629, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1596, -7.66347, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (630, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15964, -7.66317, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (631, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15968, -7.66297, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (632, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15971, -7.66276, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (633, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15976, -7.66242, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (634, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15979, -7.6622, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (635, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15983, -7.66197, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (636, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15987, -7.66175, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (637, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15992, -7.66142, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (638, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15997, -7.6611, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (639, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16003, -7.66077, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (640, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1601, -7.66034, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (641, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15616, -7.65856, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (642, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15595, -7.6585, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (643, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15547, -7.65835, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (644, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15675, -7.65781, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (645, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15634, -7.65772, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (646, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15593, -7.65764, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (647, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15588, -7.65763, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (648, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15573, -7.65761, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (649, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15573, -7.65761, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (650, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15716, -7.65784, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (651, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15743, -7.65788, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (652, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15792, -7.65795, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (653, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15855, -7.65807, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (654, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15895, -7.65813, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (655, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.1595, -7.65821, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (656, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15982, -7.65827, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (657, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.16014, -7.65832, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (658, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.16034, -7.65835, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (659, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16034, -7.65909, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (660, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16034, -7.65909, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (661, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.16033, -7.65898, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (662, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16042, -7.65828, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (663, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16057, -7.65741, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (664, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16058, -7.65733, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (665, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16068, -7.65686, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (666, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16072, -7.65669, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (667, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16072, -7.65669, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (668, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16073, -7.65664, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (669, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16073, -7.65661, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (670, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1606, -7.6568, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (671, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.16041, -7.65678, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (672, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.16007, -7.65679, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (673, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15963, -7.6568, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (674, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15901, -7.65682, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (675, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15897, -7.65682, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (676, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15879, -7.65733, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (677, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15861, -7.65685, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (678, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15817, -7.65688, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (679, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15754, -7.6569, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (680, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15714, -7.65692, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (681, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15681, -7.65692, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (682, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.15666, -7.65694, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (683, 'Stang 3M', 'DESA KAPI KEC KUNJANG', 112.15656, -7.65694, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (684, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.15875, -7.65566, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (685, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.15916, -7.65581, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (686, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.15953, -7.65595, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (687, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.15983, -7.65607, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (688, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.16015, -7.6562, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (689, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.16048, -7.65634, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (690, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.16068, -7.65642, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (691, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.16129, -7.65667, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (692, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.16177, -7.65687, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (693, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.16224, -7.65705, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (694, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.16258, -7.65718, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (695, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.16304, -7.65736, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (696, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.16346, -7.65755, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (697, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.16383, -7.6577, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (698, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.1643, -7.65788, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (699, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.1648, -7.65808, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (700, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.16527, -7.65828, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (701, 'Desa Kapi Box 1 Aset Perkim', 'DESA KAPI KEC KUNJANG', 112.16589, -7.65851, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (702, 'Independen Octa 7M', 'DESA KAPI KEC KUNJANG', 112.16945, -7.65998, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (703, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16989, -7.66014, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (704, 'Independen Octa 7M', 'DESA KAPI KEC KUNJANG', 112.16996, -7.66017, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (705, 'Independen Octa 7M', 'DESA KAPI KEC KUNJANG', 112.17037, -7.66034, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (706, 'Independen Octa 7M', 'DESA KAPI KEC KUNJANG', 112.17077, -7.6605, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (707, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16985, -7.66039, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (708, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16974, -7.66085, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (709, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16963, -7.66126, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (710, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16961, -7.66134, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (711, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16961, -7.66134, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (712, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16961, -7.66134, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (713, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16956, -7.66151, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (714, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16951, -7.66169, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (715, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16946, -7.66187, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (716, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16944, -7.66196, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (717, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16937, -7.66222, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (718, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1692, -7.66273, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (719, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1689, -7.66264, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (720, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16872, -7.6626, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (721, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16803, -7.66241, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (722, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16779, -7.66279, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (723, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16777, -7.6629, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (724, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16772, -7.66312, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (725, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16768, -7.66331, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (726, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16758, -7.66388, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (727, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16755, -7.66401, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (728, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16753, -7.66414, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (729, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16749, -7.66437, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (730, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16747, -7.66457, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (731, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16794, -7.66452, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (732, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16829, -7.66458, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (733, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16867, -7.66465, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (734, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16906, -7.66474, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (735, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16917, -7.66476, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (736, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16941, -7.6648, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (737, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16969, -7.66485, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (738, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16968, -7.66525, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (739, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16952, -7.66532, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (740, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16985, -7.66471, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (741, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16991, -7.66444, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (742, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16999, -7.66402, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (743, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17003, -7.66383, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (744, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17003, -7.66364, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (745, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16972, -7.66355, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (746, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16937, -7.66344, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (747, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16934, -7.66312, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (748, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.1694, -7.66293, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (749, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16906, -7.66335, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (750, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.16885, -7.66386, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (751, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.1687, -7.66322, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (752, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16831, -7.6631, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (753, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16818, -7.66337, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (754, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16809, -7.66377, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (755, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16808, -7.66382, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (756, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.16802, -7.66411, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (757, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17005, -7.66469, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (758, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17043, -7.66479, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (759, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17068, -7.66487, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (760, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17106, -7.66497, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (761, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17136, -7.66506, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (762, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17178, -7.66519, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (763, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17219, -7.66531, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (764, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17252, -7.66544, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (765, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17246, -7.66553, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (766, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17242, -7.6656, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (767, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17241, -7.66564, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (768, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17239, -7.66568, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (769, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17237, -7.66572, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (770, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17236, -7.66574, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (771, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17235, -7.66577, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (772, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17234, -7.66578, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (773, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17234, -7.66578, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (774, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17234, -7.66578, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (775, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17234, -7.66578, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (776, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17299, -7.66571, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (777, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.173, -7.6659, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (778, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17284, -7.66643, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (779, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17281, -7.66657, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (780, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17278, -7.66667, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (781, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17265, -7.66699, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (782, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17316, -7.66545, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (783, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17278, -7.66518, 'TL', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (784, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17232, -7.66482, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (785, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17196, -7.66467, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (786, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17169, -7.6646, 'TL', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (787, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17151, -7.66456, 'TL', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (788, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17143, -7.66476, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (789, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17126, -7.66442, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (790, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17118, -7.66431, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (791, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17062, -7.66429, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (792, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17048, -7.66428, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (793, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.1703, -7.66372, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (794, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17061, -7.6638, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (795, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17089, -7.66387, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (796, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17131, -7.66398, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (797, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.1714, -7.66377, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (798, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17146, -7.6636, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (799, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17173, -7.66365, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (800, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17186, -7.66374, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (801, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17199, -7.66385, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (802, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17208, -7.66391, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (803, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17136, -7.66353, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (804, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17122, -7.66346, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (805, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17111, -7.6634, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (806, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17151, -7.66351, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (807, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17163, -7.66322, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (808, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17166, -7.66315, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (809, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17177, -7.66292, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (810, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17188, -7.66267, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (811, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17205, -7.66228, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (812, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17222, -7.66185, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (813, 'ASET DESA ILEGAL', 'DESA KAPI KEC KUNJANG', 112.17233, -7.66157, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (814, 'ASET DESA LEGAL', 'DESA KAPI KEC KUNJANG', 112.17241, -7.66135, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (815, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15164, -7.65722, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (816, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15144, -7.65708, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (817, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15142, -7.65699, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (818, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15145, -7.6568, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (819, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15153, -7.65636, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (820, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15159, -7.65604, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (821, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15184, -7.65614, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (822, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15175, -7.65674, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (823, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1517, -7.65706, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (824, 'Independen Octa 6M', 'DESA KUJANG KEC KUNJANG', 112.15197, -7.65789, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (825, 'Independen Octa 6M', 'DESA KUJANG KEC KUNJANG', 112.15251, -7.65801, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (826, 'Independen Octa 6M', 'DESA KUJANG KEC KUNJANG', 112.15295, -7.65811, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (827, 'Independen Octa 6M', 'DESA KUJANG KEC KUNJANG', 112.15342, -7.65816, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (828, 'Independen Octa 6M', 'DESA KUJANG KEC KUNJANG', 112.15355, -7.65805, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (829, 'Independen Octa 6M', 'DESA KUJANG KEC KUNJANG', 112.15388, -7.65783, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (830, 'Independen Octa 6M', 'DESA KUJANG KEC KUNJANG', 112.15418, -7.65763, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (831, 'Stang 3M', 'DESA KUJANG KEC KUNJANG', 112.15464, -7.65732, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (832, 'Stang 3M', 'DESA KUJANG KEC KUNJANG', 112.15484, -7.65718, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (833, 'Stang 3M', 'DESA KUJANG KEC KUNJANG', 112.1551, -7.65699, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (834, 'Stang 3M', 'DESA KUJANG KEC KUNJANG', 112.15537, -7.65682, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (835, 'Stang 3M', 'DESA KUJANG KEC KUNJANG', 112.15582, -7.65677, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (836, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15542, -7.65662, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (837, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15519, -7.65649, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (838, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15501, -7.65642, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (839, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15497, -7.6564, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (840, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15483, -7.65633, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (841, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15473, -7.65626, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (842, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15455, -7.6562, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (843, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15437, -7.65615, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (844, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15421, -7.65598, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (845, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15412, -7.65584, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (846, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15329, -7.65562, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (847, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15323, -7.65561, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (848, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15313, -7.65558, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (849, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15308, -7.65556, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (850, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15287, -7.6555, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (851, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15277, -7.65546, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (852, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15266, -7.65543, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (853, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15254, -7.6554, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (854, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15243, -7.65537, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (855, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15232, -7.65534, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (856, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15222, -7.65531, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (857, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15212, -7.65526, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (858, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15398, -7.65573, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (859, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15404, -7.65556, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (860, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15407, -7.6555, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (861, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15421, -7.6552, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (862, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15416, -7.65516, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (863, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1538, -7.65502, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (864, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15356, -7.65496, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (865, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15332, -7.65491, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (866, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15423, -7.65516, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (867, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15451, -7.65523, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (868, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15457, -7.65525, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (869, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15485, -7.65534, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (870, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1552, -7.65547, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (871, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.15526, -7.65549, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (872, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15544, -7.65554, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (873, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.15556, -7.65558, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (874, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15574, -7.65564, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (875, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15591, -7.65573, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (876, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.15608, -7.65577, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (877, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15614, -7.65579, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (878, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1562, -7.65581, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (879, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15632, -7.65585, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (880, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1566, -7.65596, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (881, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15674, -7.65601, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (882, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15677, -7.65601, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (883, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15679, -7.65601, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (884, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15679, -7.65601, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (885, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15707, -7.65531, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (886, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.15714, -7.65488, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (887, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15694, -7.65469, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (888, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15684, -7.65464, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (889, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15652, -7.65449, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (890, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15635, -7.6547, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (891, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.15635, -7.65474, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (892, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15665, -7.65398, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (893, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15674, -7.65365, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (894, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15665, -7.65359, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (895, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15644, -7.6535, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (896, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15627, -7.65342, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (897, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1561, -7.65336, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (898, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15583, -7.65325, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (899, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15559, -7.65318, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (900, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15529, -7.65309, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (901, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15496, -7.65296, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (902, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15682, -7.65363, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (903, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15632, -7.65441, 'TL', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (904, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1562, -7.65437, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (905, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15583, -7.65421, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (906, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15575, -7.65417, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (907, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15556, -7.65406, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (908, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.15478, -7.65375, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (909, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.15464, -7.65407, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (910, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.15447, -7.65357, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (911, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.15411, -7.6534, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (912, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1535, -7.65312, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (913, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15342, -7.65309, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (914, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15333, -7.65305, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (915, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15271, -7.65385, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (916, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15282, -7.65389, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (917, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.153, -7.65394, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (918, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.153, -7.65394, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (919, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15316, -7.654, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (920, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15327, -7.65403, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (921, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15346, -7.65408, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (922, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15369, -7.65414, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (923, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15385, -7.6542, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (924, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15402, -7.65425, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (925, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15434, -7.65435, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (926, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15445, -7.65449, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (927, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15434, -7.6548, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (928, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15448, -7.65442, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (929, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15465, -7.65447, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (930, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15487, -7.65453, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (931, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15511, -7.65461, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (932, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15538, -7.6547, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (933, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15566, -7.65478, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (934, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1559, -7.65486, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (935, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15625, -7.65498, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (936, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15639, -7.65503, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (937, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15664, -7.65512, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (938, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15731, -7.65537, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (939, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15728, -7.65558, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (940, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15707, -7.65582, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (941, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15671, -7.65627, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (942, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15651, -7.6565, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (943, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15638, -7.65666, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (944, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15618, -7.65691, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (945, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15593, -7.65725, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (946, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15575, -7.6575, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (947, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15549, -7.65783, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (948, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.1553, -7.65807, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (949, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15497, -7.65849, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (950, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15464, -7.6589, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (951, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15445, -7.65915, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (952, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15419, -7.6595, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (953, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15382, -7.65997, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (954, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15323, -7.66014, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (955, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15285, -7.66002, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (956, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15242, -7.65988, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (957, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.15191, -7.65971, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (958, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.1575, -7.6552, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (959, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15768, -7.65488, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (960, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15794, -7.65437, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (961, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15809, -7.65401, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (962, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15823, -7.65374, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (963, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15842, -7.65335, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (964, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15858, -7.653, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (965, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15873, -7.6527, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (966, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15886, -7.65241, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (967, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15903, -7.65203, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (968, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15915, -7.65175, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (969, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15944, -7.6511, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (970, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15975, -7.65048, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (971, 'Desa Kunjang Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.16006, -7.64979, 'LED', 'K1', 4, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (972, 'Desa Kapi Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15803, -7.65537, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (973, 'Desa Kapi Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.15838, -7.6555, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (974, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16084, -7.6559, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (975, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16116, -7.65598, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (976, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16145, -7.65606, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (977, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16166, -7.65612, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (978, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16197, -7.65619, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (979, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16214, -7.65624, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (980, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16233, -7.65629, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (981, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16267, -7.65637, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (982, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16301, -7.65646, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (983, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1635, -7.65661, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (984, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16383, -7.65669, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (985, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1639, -7.6567, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (986, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16418, -7.65679, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (987, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16441, -7.65686, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (988, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16474, -7.65696, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (989, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16509, -7.65706, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (990, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16544, -7.65715, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (991, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16564, -7.65719, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (992, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16592, -7.65726, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (993, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16624, -7.65733, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (994, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16667, -7.65743, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (995, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16695, -7.6575, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (996, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16724, -7.65757, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (997, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16753, -7.65765, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (998, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16763, -7.65768, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (999, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16792, -7.65774, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1000, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16832, -7.65779, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1001, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16872, -7.65783, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1002, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16908, -7.65789, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1003, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16948, -7.65801, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1004, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16973, -7.65827, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1005, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16968, -7.65854, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1006, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16964, -7.65877, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1007, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16961, -7.65893, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1008, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16954, -7.65925, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1009, 'Desa Kapi Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.16932, -7.65995, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1010, 'Desa Kapi Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.16897, -7.65984, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1011, 'Desa Kapi Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.16849, -7.65966, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1012, 'Desa Kapi Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.16815, -7.65952, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1013, 'Desa Kapi Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.16766, -7.65932, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1014, 'Desa Kapi Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.16727, -7.65917, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1015, 'Desa Kapi Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.16687, -7.65901, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1016, 'Desa Kapi Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.16638, -7.65882, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1017, 'Desa Kapi Box 1 Aset Perkim', 'DESA KUJANG KEC KUNJANG', 112.16598, -7.65865, 'LED', 'K1', 3, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1018, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16972, -7.65873, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1019, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1698, -7.65876, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1020, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17, -7.65883, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1021, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.17023, -7.6589, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1022, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17036, -7.65868, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1023, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17037, -7.65895, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1024, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17062, -7.65902, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1025, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17093, -7.65911, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1026, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17131, -7.6592, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1027, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.17109, -7.65897, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1028, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17116, -7.65881, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1029, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17119, -7.65859, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1030, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17119, -7.65847, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1031, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17094, -7.65835, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1032, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17053, -7.65825, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1033, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17056, -7.65799, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1034, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17061, -7.65778, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1035, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.17057, -7.65764, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1036, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17046, -7.65761, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1037, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1703, -7.65758, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1038, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17001, -7.65755, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1039, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16977, -7.65793, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1040, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16978, -7.6579, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1041, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16986, -7.6575, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1042, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16986, -7.6575, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1043, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16991, -7.65698, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1044, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16994, -7.65678, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1045, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17, -7.65633, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1046, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17009, -7.65583, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1047, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17025, -7.65535, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1048, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17039, -7.65489, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1049, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17053, -7.65447, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1050, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17067, -7.65404, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1051, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17081, -7.65361, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1052, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17099, -7.6531, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1053, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17069, -7.65288, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1054, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17032, -7.65275, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1055, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16962, -7.65251, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1056, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16932, -7.6524, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1057, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16966, -7.65033, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1058, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16974, -7.65004, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1059, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16977, -7.64994, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1060, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16984, -7.64972, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1061, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.17002, -7.64921, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1062, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16959, -7.65058, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1063, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16912, -7.65213, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1064, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16675, -7.65234, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1065, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16652, -7.6523, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1066, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16625, -7.65224, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1067, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16623, -7.6518, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1068, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16624, -7.6516, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1069, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16632, -7.65106, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1070, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16637, -7.65068, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1071, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16643, -7.65038, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1072, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16598, -7.65013, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1073, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16561, -7.65, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1074, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16511, -7.64982, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1075, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16479, -7.64971, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1076, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16419, -7.64939, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1077, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16364, -7.64912, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1078, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16319, -7.64899, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1079, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16281, -7.64888, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1080, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1666, -7.64988, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1081, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16662, -7.64982, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1082, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16678, -7.64923, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1083, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16883, -7.65127, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1084, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16833, -7.65116, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1085, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16811, -7.6511, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1086, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16827, -7.65035, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1087, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16858, -7.65038, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1088, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16807, -7.65024, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1089, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16766, -7.65012, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1090, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16705, -7.64997, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1091, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1668, -7.65073, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1092, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16701, -7.6508, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1093, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16753, -7.65044, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1094, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16717, -7.65174, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1095, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16695, -7.6517, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1096, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16709, -7.65175, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1097, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16782, -7.65184, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1098, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16789, -7.65158, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1099, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16787, -7.65195, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1100, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16876, -7.65167, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1101, 'ASET DESA ILEGAL', 'DESA KUJANG KEC KUNJANG', 112.16867, -7.65215, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1102, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16683, -7.65239, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1103, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.1658, -7.65216, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1104, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16538, -7.65208, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1105, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16487, -7.65199, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1106, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16443, -7.65191, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1107, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16421, -7.65205, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1108, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.163, -7.65644, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1109, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16295, -7.65591, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1110, 'ASET DESA LEGAL', 'DESA KUJANG KEC KUNJANG', 112.16087, -7.65581, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1111, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16234, -7.64445, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1112, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16252, -7.64416, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1113, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16271, -7.64376, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1114, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.1629, -7.64333, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1115, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16305, -7.64298, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1116, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16322, -7.64257, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1117, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16338, -7.6422, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1118, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16473, -7.63956, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1119, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16477, -7.63957, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1120, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16477, -7.63957, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1121, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16481, -7.63959, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1122, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16485, -7.63961, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1123, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16485, -7.63961, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1124, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16525, -7.6398, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1125, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16562, -7.63996, 'TL', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1126, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16568, -7.63998, 'TL', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1127, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16573, -7.64001, 'TL', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1128, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16579, -7.64003, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1129, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16613, -7.64019, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1130, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16632, -7.64027, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1131, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16658, -7.64038, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1132, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16691, -7.64051, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1133, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16712, -7.64061, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1134, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16755, -7.64077, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1135, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16769, -7.64053, 'TL', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1136, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16782, -7.6402, 'TL', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1137, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16689, -7.6394, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1138, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16592, -7.63923, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1139, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16703, -7.64039, 'TL', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1140, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16703, -7.64039, 'TL', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1141, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16744, -7.64138, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1142, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1679, -7.64091, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1143, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16805, -7.64097, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1144, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16828, -7.64107, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1145, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.16857, -7.64119, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1146, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16887, -7.64072, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1147, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16892, -7.64054, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1148, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16898, -7.64034, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1149, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.169, -7.64028, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1150, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16902, -7.64019, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1151, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.169, -7.64017, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1152, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16899, -7.64016, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1153, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16894, -7.64016, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1154, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1689, -7.64014, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1155, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16884, -7.64012, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1156, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16882, -7.64012, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1157, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16913, -7.64027, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1158, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16944, -7.64038, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1159, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1698, -7.64049, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1160, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.16999, -7.64055, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1161, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17036, -7.64068, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1162, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.17091, -7.64084, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1163, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.17138, -7.64099, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1164, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.1718, -7.64112, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1165, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.17215, -7.64124, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1166, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.17252, -7.64136, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1167, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.17306, -7.64151, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1168, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.1734, -7.64162, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1169, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.17409, -7.64185, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1170, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.17441, -7.64196, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1171, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.17491, -7.64213, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1172, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.17535, -7.64227, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1173, 'Desa Pakis Box 1 Aset Perkim', 'DESA PAKIS KEC KUNJANG', 112.17583, -7.64244, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1174, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17615, -7.64265, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1175, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17617, -7.6426, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1176, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17621, -7.64251, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1177, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17624, -7.64242, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1178, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17629, -7.6423, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1179, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17651, -7.64176, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1180, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17664, -7.64148, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1181, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1765, -7.64136, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1182, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17615, -7.64124, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1183, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17591, -7.64117, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1184, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17542, -7.64098, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1185, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17513, -7.64088, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1186, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17475, -7.64146, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1187, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1751, -7.64154, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1188, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17533, -7.64161, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1189, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17558, -7.64166, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1190, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17505, -7.64171, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1191, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1745, -7.64134, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1192, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17407, -7.64121, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1193, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17351, -7.6409, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1194, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17359, -7.64066, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1195, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17362, -7.64058, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1196, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17262, -7.64027, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1197, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17244, -7.64021, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1198, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17188, -7.64003, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1199, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17163, -7.64061, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1200, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17135, -7.63992, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1201, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17158, -7.63933, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1202, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17174, -7.6389, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1203, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17131, -7.63868, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1204, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17185, -7.63868, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1205, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17204, -7.63816, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1206, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1724, -7.6373, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1207, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17259, -7.63685, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1208, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17279, -7.63635, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1209, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17284, -7.63621, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1210, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17274, -7.63607, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1211, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17266, -7.63605, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1212, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1726, -7.63601, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1213, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17265, -7.636, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1214, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17276, -7.64201, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1215, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17178, -7.6417, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1216, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17311, -7.64324, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1217, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17246, -7.64426, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1218, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17194, -7.64412, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1219, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17182, -7.64434, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1220, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17162, -7.64479, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1221, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17157, -7.64492, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1222, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17151, -7.6451, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1223, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17145, -7.64542, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1224, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17179, -7.64552, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1225, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17216, -7.64564, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1226, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17256, -7.64576, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1227, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1729, -7.64587, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1228, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17321, -7.64598, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1229, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17361, -7.64611, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1230, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17386, -7.64584, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1231, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.174, -7.64532, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1232, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17442, -7.64543, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1233, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17356, -7.64517, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1234, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1732, -7.64508, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1235, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17288, -7.64497, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1236, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17249, -7.64485, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1237, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1722, -7.64477, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1238, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17205, -7.64472, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1239, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1719, -7.64468, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1240, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17184, -7.64466, 'LED', 'NON K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1241, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17143, -7.64536, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1242, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.1714, -7.64552, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1243, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17132, -7.64573, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1244, 'Desa Pakis Box 1 Aset Desa', 'DESA PAKIS KEC KUNJANG', 112.17129, -7.6458, 'LED', 'K1', 5, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1245, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17251, -7.66102, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1246, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17264, -7.66062, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1247, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17295, -7.66064, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1248, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17318, -7.66074, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1249, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17328, -7.66085, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1250, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17323, -7.66099, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1251, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17314, -7.66126, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1252, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17266, -7.66043, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1253, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1727, -7.66019, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1254, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17272, -7.66002, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1255, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17275, -7.65964, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1256, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17242, -7.65959, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1257, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17285, -7.65954, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1258, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1729, -7.65932, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1259, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17296, -7.65902, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1260, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17283, -7.65889, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1261, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17253, -7.65881, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1262, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17253, -7.65881, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1263, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17238, -7.65876, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1264, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17222, -7.65864, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1265, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17206, -7.65846, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1266, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1719, -7.65828, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1267, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17248, -7.65877, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1268, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17251, -7.65878, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1269, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.172, -7.65946, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1270, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17191, -7.65944, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1271, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17174, -7.65939, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1272, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17154, -7.6593, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1273, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1714, -7.65924, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1274, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1713, -7.65922, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1275, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17182, -7.65956, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1276, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17176, -7.65978, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1277, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1717, -7.66014, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1278, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17176, -7.66018, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1279, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17206, -7.66024, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1280, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17215, -7.66018, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1281, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17218, -7.65991, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1282, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17219, -7.65985, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1283, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17206, -7.66049, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1284, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.172, -7.66078, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1285, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17082, -7.66053, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1286, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17107, -7.66052, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1287, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17112, -7.6603, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1288, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17123, -7.66022, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1289, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17145, -7.66029, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1290, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17119, -7.6607, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1291, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1715, -7.66081, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1292, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17183, -7.66094, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1293, 'Desa Tengger Lor box 1 Aset Desa', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17211, -7.66105, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1294, 'Desa Tengger Lor box 1 Aset Desa', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1724, -7.66117, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1295, 'Desa Tengger Lor box 1 Aset Desa', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1724, -7.66117, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1296, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1728, -7.66134, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1297, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17318, -7.6615, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1298, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17364, -7.66169, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1299, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17402, -7.66184, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1300, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17439, -7.66199, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1301, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17478, -7.66214, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1302, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17517, -7.6623, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1303, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17555, -7.66245, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1304, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17606, -7.66265, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1305, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17648, -7.66281, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1306, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17691, -7.66298, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1307, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17734, -7.66315, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1308, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17779, -7.66332, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1309, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17811, -7.66345, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1310, 'Independen Octa 7M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17863, -7.66366, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1311, 'Independen Octa 7M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17888, -7.66376, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1312, 'Independen Octa 7M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17931, -7.66393, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1313, 'Independen Octa 7M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17954, -7.66403, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1314, 'Independen Octa 7M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17989, -7.66417, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1315, 'Independen Octa 7M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18019, -7.66429, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1316, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17958, -7.66417, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1317, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17955, -7.6643, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1318, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17947, -7.66454, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1319, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17926, -7.66506, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1320, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17917, -7.66526, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1321, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17909, -7.66547, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1322, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.179, -7.66569, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1323, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17891, -7.66591, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1324, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17879, -7.66621, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1325, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17869, -7.66644, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1326, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17861, -7.6667, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1327, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1786, -7.66676, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1328, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17082, -7.66053, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1329, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17107, -7.66052, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1330, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17112, -7.6603, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1331, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17123, -7.66022, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1332, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17145, -7.66029, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1333, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17119, -7.6607, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1334, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1715, -7.66081, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1335, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17183, -7.66094, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1336, 'Desa Tengger Lor box 1 Aset Desa', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17211, -7.66105, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1337, 'Desa Tengger Lor box 1 Aset Desa', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1724, -7.66117, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1338, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1724, -7.66117, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1339, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1728, -7.66134, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1340, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17318, -7.6615, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1341, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17364, -7.66169, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1342, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17402, -7.66184, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1343, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17439, -7.66199, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1344, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17478, -7.66214, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1345, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17517, -7.6623, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1346, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17555, -7.66245, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1347, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17606, -7.66265, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1348, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17648, -7.66281, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1349, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17691, -7.66298, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1350, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17734, -7.66315, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1351, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17779, -7.66332, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1352, 'Desa Tengger Lor box 1 Aset Perkim', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17811, -7.66345, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1353, 'Independen Octa 7M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17863, -7.66366, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1354, 'Independen Octa 7M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17888, -7.66376, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1355, 'Independen Octa 7M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17931, -7.66393, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1356, 'Independen Octa 7M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17954, -7.66403, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1357, 'Independen Octa 7M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17989, -7.66417, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1358, 'Independen Octa 7M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18019, -7.66429, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1359, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17958, -7.66417, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1360, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17955, -7.6643, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1361, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17947, -7.66454, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1362, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17926, -7.66506, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1363, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17917, -7.66526, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1364, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17909, -7.66547, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1365, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.179, -7.66569, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1366, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17891, -7.66591, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1367, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17879, -7.66621, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1368, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17869, -7.66644, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1369, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17861, -7.6667, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1370, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1786, -7.66676, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1371, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17854, -7.66697, 'TL', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1372, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1781, -7.66705, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1373, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1778, -7.66817, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1374, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17772, -7.66843, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1375, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17768, -7.66855, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1376, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17761, -7.66874, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1377, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17758, -7.66885, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1378, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17755, -7.66893, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1379, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17749, -7.66894, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1380, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17741, -7.66891, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1381, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17738, -7.6689, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1382, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1773, -7.66888, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1383, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17731, -7.66888, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1384, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17733, -7.66888, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1385, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17759, -7.66884, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1386, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17811, -7.66779, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1387, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1783, -7.66787, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1388, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17855, -7.66796, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1389, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17887, -7.66807, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1390, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18027, -7.66862, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1391, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18017, -7.66901, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1392, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18034, -7.66908, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1393, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18061, -7.66915, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1394, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.181, -7.66934, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1395, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1814, -7.66955, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1396, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18147, -7.66963, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1397, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18144, -7.66969, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1398, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1814, -7.66975, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1399, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18139, -7.66979, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1400, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18136, -7.66979, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1401, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18137, -7.66979, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1402, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18196, -7.66979, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1403, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18243, -7.671, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1404, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18235, -7.67119, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1405, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18227, -7.67133, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1406, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18219, -7.6715, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1407, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18189, -7.67215, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1408, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18186, -7.67227, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1409, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18185, -7.6723, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1410, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18167, -7.67286, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1411, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1816, -7.6731, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1412, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18129, -7.67408, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1413, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18032, -7.66834, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1414, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18042, -7.66801, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1415, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18032, -7.66793, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1416, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17937, -7.66752, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1417, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17925, -7.66746, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1418, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17925, -7.66746, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1419, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17908, -7.66738, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1420, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17896, -7.66732, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1421, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1785, -7.66705, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1422, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18086, -7.66308, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1423, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18095, -7.66288, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1424, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18123, -7.66203, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1425, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18138, -7.66163, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1426, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18143, -7.6614, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1427, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1815, -7.66111, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1428, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18157, -7.66082, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1429, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18166, -7.66049, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1430, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18175, -7.66016, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1431, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18181, -7.65993, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1432, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1819, -7.65959, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1433, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18199, -7.65925, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1434, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18206, -7.65903, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1435, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18272, -7.65733, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1436, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18282, -7.6571, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1437, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18292, -7.65688, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1438, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18295, -7.65681, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1439, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.183, -7.65669, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1440, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18307, -7.65653, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1441, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18324, -7.65616, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1442, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18341, -7.65584, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1443, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18344, -7.65574, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1444, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18346, -7.6557, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1445, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18092, -7.66143, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1446, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17893, -7.66074, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1447, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17886, -7.66082, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1448, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17814, -7.66301, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1449, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1781, -7.66316, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1450, 'Desa Tengger Lor box 1 Aset Desa', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17803, -7.66341, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1451, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17943, -7.66374, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1452, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17948, -7.66352, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1453, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17912, -7.66339, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1454, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17863, -7.66318, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1455, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1787, -7.66283, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1456, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17891, -7.66213, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1457, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17916, -7.66138, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1458, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17962, -7.6614, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1459, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17981, -7.66147, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1460, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18009, -7.66157, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1461, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18063, -7.66177, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1462, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18079, -7.66181, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1463, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18079, -7.66191, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1464, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18066, -7.6622, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1465, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18036, -7.6628, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1466, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18006, -7.6627, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1467, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17983, -7.66261, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1468, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17987, -7.66233, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1469, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17975, -7.66284, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1470, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17962, -7.66323, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1471, 'Desa Tengger Lor box 1 Aset Desa', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17578, -7.6625, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1472, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17587, -7.66202, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1473, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17592, -7.66174, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1474, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17593, -7.66169, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1475, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.176, -7.66131, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1476, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17601, -7.66126, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1477, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17612, -7.66074, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1478, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17613, -7.66068, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1479, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17617, -7.66046, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1480, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17623, -7.66013, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1481, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1763, -7.65969, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1482, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1763, -7.65969, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1483, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17638, -7.65922, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1484, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17638, -7.65922, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1485, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17647, -7.65877, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1486, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17648, -7.65868, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1487, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1765, -7.6585, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1488, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17658, -7.65805, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1489, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17668, -7.65744, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1490, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17678, -7.65698, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1491, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17683, -7.65674, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1492, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1769, -7.65636, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1493, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17695, -7.65615, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1494, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17703, -7.65575, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1495, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17711, -7.65538, 'LED', '', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1496, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17729, -7.65471, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1497, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17741, -7.65429, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1498, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1775, -7.65404, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1499, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17758, -7.65371, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1500, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17768, -7.65342, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1501, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1778, -7.65294, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1502, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17786, -7.65272, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1503, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17798, -7.6523, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1504, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17811, -7.65185, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1505, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17819, -7.6516, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1506, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17828, -7.65128, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1507, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17836, -7.65102, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1508, 'Independen Bulat 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17844, -7.65076, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1509, 'Stang 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17855, -7.65045, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1510, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17866, -7.65043, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1511, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1790424, -7.6506413, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1512, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17956, -7.65085, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1513, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17996, -7.65104, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1514, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18036, -7.65124, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1515, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18076, -7.65143, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1516, 'Stang 3M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18123, -7.65165, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1517, 'Stang 5M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17862, -7.65011, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1518, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17872, -7.64975, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1519, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1788, -7.64954, 'TL', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1520, 'Stang 5M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17887, -7.6493, 'TL', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1521, 'Stang 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17902, -7.64885, 'TL', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1522, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17908, -7.64866, 'TL', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1523, 'Stang 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17914, -7.64849, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1524, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17924, -7.64822, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1525, 'Stang 6M', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17932, -7.64797, 'LED', 'K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1526, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17916, -7.6493, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1527, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17936, -7.64935, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1528, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1795, -7.6494, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1529, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17968, -7.64948, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1530, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17996, -7.64962, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1531, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18008, -7.64968, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1532, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18046, -7.64989, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1533, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18067, -7.64999, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1534, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18109, -7.65018, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1535, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1815, -7.65036, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1536, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18172, -7.65045, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1537, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17891, -7.64979, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1538, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17912, -7.64986, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1539, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17938, -7.64998, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1540, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17972, -7.65012, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1541, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18001, -7.65024, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1542, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18019, -7.65032, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1543, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18044, -7.65042, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1544, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18057, -7.65047, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1545, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18084, -7.65059, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1546, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18105, -7.65066, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1547, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18117, -7.6507, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1548, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18133, -7.65078, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1549, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18142, -7.65082, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1550, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18149, -7.65085, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1551, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18153, -7.65086, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1552, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.18153, -7.65086, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1553, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17836, -7.64962, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1554, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17823, -7.64958, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1555, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17785, -7.64945, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1556, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17754, -7.64934, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1557, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17719, -7.64923, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1558, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17669, -7.64906, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1559, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17669, -7.64906, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1560, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17652, -7.64898, 'LED', '', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1561, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17514, -7.64813, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1562, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17528, -7.64773, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1563, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17531, -7.64762, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1564, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17537, -7.64746, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1565, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17543, -7.64728, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1566, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17549, -7.64709, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1567, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17554, -7.64692, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1568, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17562, -7.64669, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1569, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17571, -7.64644, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1570, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1759, -7.64592, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1571, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17564, -7.64682, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1572, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17579, -7.64689, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1573, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17604, -7.64699, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1574, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17625, -7.64707, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1575, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17644, -7.64714, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1576, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17662, -7.6472, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1577, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17675, -7.64725, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1578, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17706, -7.64736, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1579, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17736, -7.64748, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1580, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1776, -7.64757, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1581, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17786, -7.64765, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1582, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17808, -7.64771, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1583, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1783, -7.64779, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1584, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17844, -7.64784, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1585, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1787, -7.64795, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1586, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17888, -7.64803, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1587, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17912, -7.64812, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1588, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17865, -7.64871, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1589, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17835, -7.64862, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1590, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17796, -7.64849, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1591, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17756, -7.64836, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1592, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17699, -7.64818, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1593, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17657, -7.64804, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1594, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17624, -7.64793, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1595, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17593, -7.64749, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1596, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1755, -7.64815, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1597, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17575, -7.64822, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1598, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17592, -7.64828, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1599, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17621, -7.64838, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1600, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17641, -7.64844, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1601, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17689, -7.64861, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1602, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17719, -7.64873, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1603, 'ASET DESA ILEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17754, -7.64886, 'LED', 'NON K', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1604, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17824, -7.65019, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1605, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17806, -7.65013, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1606, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.17761, -7.64995, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1607, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1773, -7.64983, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1608, 'ASET DESA LEGAL', 'DESA TENGGER LOR KEC KUNJANG.csv', 112.1769, -7.64966, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1609, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18952, -7.67194, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1610, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18915, -7.67179, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1611, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18884, -7.67166, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1612, 'ASET DESA ILEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18857, -7.6724, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1613, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18905, -7.67278, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1614, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18958, -7.67192, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1615, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18961, -7.67188, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1616, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18838, -7.67152, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1617, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18787, -7.67114, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1618, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18765, -7.671, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1619, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18705, -7.67073, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1620, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.1867, -7.67057, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1621, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18608, -7.67028, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1622, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18606, -7.6701, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1623, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18612, -7.66996, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1624, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18638, -7.66935, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1625, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18562, -7.67008, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1626, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18548, -7.67002, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1627, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18518, -7.66988, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1628, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18486, -7.66975, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1629, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18442, -7.66957, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1630, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18419, -7.66947, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1631, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18383, -7.66932, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1632, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.1837, -7.66882, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1633, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18377, -7.66859, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1634, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18386, -7.66846, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1635, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18358, -7.6693, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1636, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18274, -7.66981, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1637, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18255, -7.66983, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1638, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18212, -7.66987, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1639, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18221, -7.67025, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1640, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18232, -7.67052, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1641, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18249, -7.6708, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1642, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18315, -7.66984, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1643, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18532, -7.67145, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1644, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.1859, -7.67197, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1645, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18601, -7.67187, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1646, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.1861, -7.67174, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1647, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18619, -7.67159, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1648, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.1863, -7.67142, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1649, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18647, -7.67107, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1650, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18655, -7.67086, 'LED', 'NON K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1651, 'ASET DESA ILEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.1864, -7.67138, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1652, 'ASET DESA ILEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18659, -7.67146, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1653, 'ASET DESA ILEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18683, -7.67156, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1654, 'ASET DESA ILEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18707, -7.67166, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1655, 'ASET DESA ILEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18735, -7.67179, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1656, 'ASET DESA ILEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18765, -7.67195, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1657, 'ASET DESA ILEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18785, -7.67205, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1658, 'ASET DESA ILEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18818, -7.67223, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1659, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18967, -7.67172, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1660, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18953, -7.67153, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1661, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18924, -7.67127, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1662, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18896, -7.67105, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1663, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18866, -7.67081, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1664, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18825, -7.6705, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1665, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.1879, -7.67023, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1666, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18754, -7.66996, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1667, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18737, -7.66982, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1668, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18711, -7.66961, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1669, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18694, -7.66947, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1670, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18668, -7.66927, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1671, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18652, -7.66915, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1672, 'Desa Wonorejo box 1 Aset desa', 'DESA WONOREJO KEC KUNJANG.csv', 112.18629, -7.66898, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1673, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18623, -7.66892, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1674, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18598, -7.66874, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1675, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18633, -7.66832, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1676, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18641, -7.66792, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1677, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18651, -7.66748, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1678, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.1866, -7.66706, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1679, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18666, -7.66677, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1680, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18674, -7.66642, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1681, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18682, -7.66605, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1682, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18689, -7.66574, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1683, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18699, -7.66531, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1684, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18707, -7.66518, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1685, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18719, -7.6652, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1686, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18727, -7.66524, 'LED', '', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1687, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18765, -7.6648, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1688, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18774, -7.66476, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1689, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18776, -7.66473, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1690, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18777, -7.66472, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1691, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18774, -7.6648, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1692, 'ASET DESA LEGAL', 'DESA WONOREJO KEC KUNJANG.csv', 112.18771, -7.66485, 'LED', 'NON K1', NULL, 'TIDAK TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1693, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18566, -7.66852, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1694, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18522, -7.66818, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1695, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18489, -7.66791, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1696, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.1846, -7.66769, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1697, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18417, -7.66735, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1698, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18328, -7.6667, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1699, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18304, -7.6665, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1700, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.1826, -7.66614, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1701, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18231, -7.66591, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1702, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.1819, -7.66559, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1703, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18168, -7.66542, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1704, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18112, -7.66498, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1705, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.18085, -7.66477, 'LED', 'K1', 2, 'TERSAMBUNG');
INSERT INTO lampu_pju (lampu_id, lampu_name, desa, longitude, latitude, lampu_type, jenis_jalan, box_id, status_koneksi)
VALUES (1706, 'Desa Wonorejo box 1 Aset Perkim', 'DESA WONOREJO KEC KUNJANG.csv', 112.1805, -7.66449, 'LED', 'K1', 2, 'TERSAMBUNG');

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
