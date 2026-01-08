# 📍 Sistem Informasi Penerangan Jalan Umum (PJU)
## Kecamatan Kunjang - Kabupaten Kediri

---

## 📊 Ringkasan Data

Hasil analisis menunjukkan:

- **Total Box Panel:** 8 unit
- **Total Lampu PJU:** 1.706 titik
- **Lampu Tersambung:** 606 titik (35.5%)
- **Lampu Tidak Tersambung:** 1.100 titik (64.5%)

---

## 📁 File yang Dihasilkan

### 1. **pju_kunjang_database.sql**
File SQL lengkap untuk membuat database MySQL/MariaDB dengan struktur:

**Tabel:**
- `box_panel` - Data Box Panel PJU
- `lampu_pju` - Data semua titik lampu PJU dengan relasi ke box panel

**Views:**
- `view_box_summary` - Ringkasan per Box Panel
- `view_desa_summary` - Ringkasan per Desa
- `view_lampu_tidak_tersambung` - Daftar lampu yang belum tersambung
- `view_box_lampu_detail` - Detail relasi Box dengan Lampu

**Cara Import:**
```bash
mysql -u root -p < pju_kunjang_database.sql
```

### 2. **pju_data.json**
File JSON berisi semua data dalam format terstruktur untuk visualisasi web.

### 3. **pju_map.html**
Aplikasi web interaktif dengan OpenLayers untuk visualisasi peta:

**Fitur:**
- ✅ Peta interaktif dengan OpenStreetMap
- 🔴 Marker merah untuk Box Panel
- 🟢 Marker hijau untuk lampu tersambung
- 🟡 Marker kuning untuk lampu tidak tersambung
- 📊 Statistik real-time
- 🔍 Filter berdasarkan desa
- 🎛️ Toggle show/hide per layer
- 📌 Info popup saat klik marker

**Cara Menggunakan:**
1. Buka file `pju_map.html` di browser
2. Pastikan file `pju_data.json` ada di folder yang sama
3. Klik marker untuk melihat detail
4. Gunakan filter di sidebar untuk menyaring data

---

## 📈 Detail Per Desa

| Desa | Total Lampu | Tersambung | Tidak Tersambung | % Tersambung |
|------|-------------|------------|------------------|--------------|
| **Tengger Lor** | 364 | 0 | 364 | 0% |
| **Juwet** | 321 | 137 | 184 | 42.7% |
| **Kunjang** | 296 | 40 | 256 | 13.5% |
| **Kapi** | 263 | 18 | 245 | 6.8% |
| **Balongjeruk** | 230 | 213 | 17 | 92.6% |
| **Pakis** | 134 | 134 | 0 | 100% |
| **Wonorejo** | 98 | 64 | 34 | 65.3% |

---

## 🔗 Relasi Box Panel dan Lampu

### Box Panel yang Teridentifikasi:

1. **Desa Tengger Lor Box 1** - (112.17591, -7.6624)
2. **Desa Wonorejo Box 1** - (112.18664, -7.6692)
3. **Desa Kapi Box 1** - (112.162716, -7.6572613)
4. **Desa Kunjang Box 1** - (112.1575915, -7.6551586)
5. **Desa Pakis Box 1** - (112.1709713, -7.6408234)
6. **Desa Juwet Box 1** - (112.1828056, -7.6523889)
7. **Desa Balongjeruk Box 1** - (112.1917222, -7.6742222)
8. **Desa Juwet Box 2** - (112.1908056, -7.6505833)

### Kriteria Relasi:

**✅ Tersambung:** Jika nama aset lampu mengandung nama Box Panel yang sama dengan daftar di atas.
- Contoh: "Desa Pakis Box 1 Aset Perkim" → TERSAMBUNG dengan Box "Desa Pakis Box 1"

**⚠️ Tidak Tersambung:** Jika nama aset lampu berbeda atau tidak mengandung nama box.
- Contoh: "ASET DESA LEGAL", "INDEPENDEN BULAT", "STANG" → TIDAK TERSAMBUNG

---

## 🛠️ Cara Generate Ulang

Jika ada update data KML, jalankan script Python:

```bash
cd "c:\Users\LENOVO\Documents\DATA RTLH\PJU"
python analyze_pju_relations.py
```

Script akan:
1. Parse semua file KML
2. Menganalisis relasi box-lampu
3. Generate ulang file SQL dan JSON
4. Tampilkan statistik di console

---

## 💾 Struktur Database

### Tabel: box_panel
```sql
CREATE TABLE box_panel (
    box_id INT PRIMARY KEY AUTO_INCREMENT,
    box_name VARCHAR(100) NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,
    latitude DECIMAL(10, 7) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Tabel: lampu_pju
```sql
CREATE TABLE lampu_pju (
    lampu_id INT PRIMARY KEY AUTO_INCREMENT,
    lampu_name VARCHAR(200) NOT NULL,
    desa VARCHAR(100) NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,
    latitude DECIMAL(10, 7) NOT NULL,
    lampu_type VARCHAR(50),
    jenis_jalan VARCHAR(20),
    box_id INT,
    status_koneksi ENUM('TERSAMBUNG', 'TIDAK TERSAMBUNG'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (box_id) REFERENCES box_panel(box_id)
);
```

---

## 📝 Query Berguna

### Lampu per Box Panel:
```sql
SELECT
    bp.box_name,
    COUNT(lp.lampu_id) as total_lampu
FROM box_panel bp
LEFT JOIN lampu_pju lp ON bp.box_id = lp.box_id
GROUP BY bp.box_id;
```

### Lampu Tidak Tersambung per Desa:
```sql
SELECT desa, COUNT(*) as total
FROM lampu_pju
WHERE status_koneksi = 'TIDAK TERSAMBUNG'
GROUP BY desa
ORDER BY total DESC;
```

### Persentase Koneksi per Desa:
```sql
SELECT * FROM view_desa_summary;
```

---

## 🎯 Rekomendasi

### Prioritas Pemasangan Box Panel Baru:

1. **Desa Tengger Lor** - 364 lampu (0% tersambung)
   - Membutuhkan minimal 3-4 box panel baru

2. **Desa Kunjang** - 296 lampu (13.5% tersambung)
   - Perlu 2-3 box panel tambahan

3. **Desa Kapi** - 263 lampu (6.8% tersambung)
   - Perlu 2-3 box panel tambahan

### Desa dengan Koneksi Baik:

- ✅ **Desa Pakis** - 100% tersambung (134 lampu)
- ✅ **Desa Balongjeruk** - 92.6% tersambung (230 lampu)

---

## 📱 Kontak Support

Untuk pertanyaan atau update data:
- **WhatsApp:** [+62 856-4571-9632](https://wa.me/6285645719632)
- **Developer:** Yarif 2025

---

## 📜 License

© 2025 Kabupaten Kediri. All rights reserved.

---

**Last Updated:** 8 Januari 2026
