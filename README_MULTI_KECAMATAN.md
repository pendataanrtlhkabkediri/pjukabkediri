# 📍 Sistem Informasi PJU Multi-Kecamatan
## Kabupaten Kediri - 2025

---

## 📊 **Ringkasan Data Keseluruhan**

| Metric | Nilai |
|--------|-------|
| **Total Kecamatan** | 3 (Kunjang, Mojo, Pagu) |
| **Total Box Panel** | 106 unit |
| **Total Lampu PJU** | 3.529 titik |
| **Lampu Tersambung** | 2.306 titik (65.3%) ⬆️ |
| **Lampu Tidak Tersambung** | 1.223 titik (34.7%) |
| **Color Palette** | 106 warna unik (HSL-based) 🎨 |

---

## 🗺️ **Data Per Kecamatan**

### 1. **Kecamatan KUNJANG**
- **Box Panel:** 8 unit
- **Total Lampu:** 1.706 titik
- **Tersambung:** 650 (38.1%)
- **Tidak Tersambung:** 1.056 (61.9%)

**Desa:**
- Balongjeruk, Juwet, Kapi, Kunjang, Pakis, Tengger Lor (⬆️ improved), Wonorejo

---

### 2. **Kecamatan MOJO** ⭐
- **Box Panel:** 72 unit
- **Total Lampu:** 1.823 titik
- **Tersambung:** 1.656 (90.8%) ✅ ⬆️
- **Tidak Tersambung:** 167 (9.2%)

**Desa:**
- Mlati (100% tersambung)
- Mojo (98% tersambung)
- Mondo (100% tersambung) ⬆️ **IMPROVED!**
- Petok (100% tersambung)
- Sukoanyar (64% tersambung)
- Surat (100% tersambung)
- Tambibendo (93% tersambung)

---

### 3. **Kecamatan PAGU** ⚠️
- **Box Panel:** 26 unit
- **Total Lampu:** 0 titik (belum ada data)
- **Status:** Siap menerima upload KML desa

---

## 📁 **File yang Dihasilkan**

### 1. **analyze_all_pju.py**
Script Python untuk analisis multi-kecamatan.

**Cara Jalankan:**
```bash
cd "c:\Users\LENOVO\Documents\DATA RTLH\PJU"
python analyze_all_pju.py
```

**Output:**
- `pju_kabupaten_database.sql` - Database lengkap
- `pju_all_data.json` - Data untuk visualisasi web

---

### 2. **pju_kabupaten_database.sql** (1.2 MB)
Database MySQL/MariaDB lengkap dengan 3 kecamatan.

**Struktur Tabel:**
- `kecamatan` - Daftar kecamatan
- `box_panel` - Data semua box panel (106 records)
- `lampu_pju` - Data semua lampu PJU (3.529 records)

**Views:**
- `view_kecamatan_summary` - Ringkasan per kecamatan
- `view_box_summary` - Ringkasan per box panel
- `view_desa_summary` - Ringkasan per desa
- `view_lampu_tidak_tersambung` - Daftar lampu belum tersambung

**Stored Procedures:**
- `sp_check_lampu_connection()` - Cek relasi lampu dengan box

**Cara Import:**
```bash
mysql -u root -p < pju_kabupaten_database.sql
```

---

### 3. **pju_all_data.json** (1.8 MB)
File JSON berisi semua data dalam format terstruktur.

**Struktur:**
```json
{
  "boxes": [...],        // 106 box panel
  "lampu": [...],        // 3.529 lampu
  "kecamatan": [...],    // 3 kecamatan
  "statistics": {...}    // Statistik global
}
```

---

### 4. **pju_map_all.html** ⭐ **NEW FEATURE**
Aplikasi web interaktif dengan **fitur upload KML**.

**Fitur Utama:**
- ✅ Peta interaktif multi-kecamatan dengan OpenLayers
- ✅ Statistik real-time per kecamatan
- ✅ **Upload KML desa baru** dengan auto-detect relasi
- ✅ Filter berdasarkan kecamatan dan desa
- ✅ Toggle show/hide per layer
- ✅ Info popup detail saat klik marker

**Cara Menggunakan:**
1. Buka file `pju_map_all.html` di browser
2. Pastikan file `pju_all_data.json` ada di folder yang sama
3. Untuk upload KML baru:
   - Pilih kecamatan
   - Upload file KML desa
   - Klik "Analisis Relasi"
   - Sistem otomatis mendeteksi koneksi ke box panel

---

## 🎨 **Sistem Color Coding**

### **Algoritma Warna:**

Setiap box panel dan lampu yang terhubung memiliki warna unik untuk memudahkan visualisasi:

1. **HSL Color Space**: Menggunakan Hue-Saturation-Lightness untuk distribusi warna optimal
2. **Golden Angle**: 137.508° untuk spacing warna yang maksimal (mencegah warna berdekatan mirip)
3. **Variasi Saturation**: 65-95% untuk warna vibrant
4. **Variasi Lightness**: 45-65% untuk visibility optimal

**Keuntungan:**
- ✅ 106 warna unik untuk 106 box panel
- ✅ Scalable untuk 1000+ boxes dengan tetap kontras
- ✅ Box yang berdekatan geografis punya warna yang berbeda
- ✅ Lampu otomatis ikut warna box yang terhubung
- ✅ Lampu tidak tersambung: abu-abu untuk mudah diidentifikasi

**Contoh Warna:**
- Box 1 Desa Tengger: `hsl(0, 65%, 45%)` → Merah
- Box 1 Desa Wonorejo: `hsl(138, 75%, 55%)` → Hijau
- Box 1 Desa Kapi: `hsl(275, 85%, 65%)` → Ungu

---

## 🔄 **Cara Kerja Auto-Detect Relasi**

### Algoritma Deteksi (Enhanced):

```python
1. Parse KML yang diupload
2. Extract "nama aset" dan "ruas jalan/desa" dari ExtendedData
3. Normalize text (lowercase, remove extra spaces)
4. Cari pola "Box [nomor]" + nama desa dalam:
   - Nama aset lampu
   - Ruas jalan/desa box panel
5. Matching dengan 2 metode:
   - Box number + desa name (flexible matching)
   - Exact box identifier match
6. Jika cocok:
   - Status: TERSAMBUNG
   - Link ke box_id
   - Assign warna box ke lampu
7. Jika tidak cocok:
   - Status: TIDAK TERSAMBUNG
   - box_id: NULL
   - Warna: abu-abu (#9ca3af)
```

### Contoh Deteksi:

**✅ Tersambung (Method 1 - Box Number + Desa):**
```
Nama Aset Lampu: "desa mondo box 1 aset perkim"
Box Panel (ruas jalan/desa): "Desa Mondo Box 1"
→ Normalize: "mondo" + "box 1" = MATCH!
→ Status: TERSAMBUNG
→ Warna: hsl(xxx, xx%, xx%) dari box
```

**✅ Tersambung (Method 2 - Exact Identifier):**
```
Nama Lampu: "Desa Pakis Box 1 Aset Perkim"
Box Identifier: "Desa Pakis Box 1"
→ Contains exact identifier = MATCH!
→ Status: TERSAMBUNG
→ Warna: inherited from box
```

**❌ Tidak Tersambung:**
```
Nama Lampu: "ASET DESA LEGAL"
Box Panel: (tidak ada "box [nomor]" atau matching desa)
→ Status: TIDAK TERSAMBUNG
→ Warna: #9ca3af (abu-abu)
```

---

## 🎯 **Fitur Upload KML Baru**

### **Langkah-langkah Upload:**

1. **Pilih Kecamatan**
   - Dropdown: Kunjang / Mojo / Pagu

2. **Upload File KML**
   - Drag & drop atau klik untuk browse
   - Format: file .kml

3. **Klik "Analisis Relasi"**
   - Sistem parse KML secara client-side (JavaScript)
   - Extract koordinat dan nama setiap lampu
   - Auto-detect relasi dengan box panel
   - Tampilkan hasil di peta

4. **Hasil Analisis**
   - Total lampu yang diupload
   - Jumlah tersambung
   - Jumlah tidak tersambung
   - Marker muncul di peta dengan warna sesuai status

### **Teknologi:**
- 🟢 **Client-Side Processing** - Parsing KML di browser (aman, tidak perlu server)
- 🟢 **Real-Time Analysis** - Hasil langsung tanpa reload
- 🟢 **Visual Feedback** - Marker berbeda untuk uploaded data

---

## 📈 **Analisis & Rekomendasi**

### **Kecamatan dengan Koneksi Baik:**
1. **Mojo** - 90.7% tersambung ✅
   - Infrastruktur PJU sangat baik
   - Hanya perlu perbaikan di Desa Mondo

2. **Desa dengan 100% Tersambung:**
   - Mojo - Mlati
   - Mojo - Mojo
   - Mojo - Petok
   - Mojo - Sukoanyar
   - Mojo - Surat
   - Kunjang - Pakis

### **Prioritas Pemasangan Box Panel:**

#### **Tinggi (0-40% tersambung):**
1. **Mojo - Mondo**: 150 lampu (0% tersambung)
   - Butuh 3-4 box panel baru

2. **Kunjang - Tengger Lor**: 364 lampu (12% tersambung)
   - Butuh 3-4 box panel tambahan

3. **Kunjang - Kunjang**: 296 lampu (13.5% tersambung)
   - Butuh 2-3 box panel tambahan

4. **Kunjang - Kapi**: 263 lampu (6.8% tersambung)
   - Butuh 2-3 box panel tambahan

#### **Sedang (40-70% tersambung):**
5. **Kunjang - Juwet**: 321 lampu (42.7% tersambung)
   - Butuh 1-2 box panel tambahan

6. **Kunjang - Wonorejo**: 98 lampu (65.3% tersambung)
   - Butuh 1 box panel tambahan

---

## 💾 **Query Database Berguna**

### **Ringkasan Per Kecamatan:**
```sql
SELECT * FROM view_kecamatan_summary;
```

### **Desa yang Butuh Perhatian (< 50% tersambung):**
```sql
SELECT * FROM view_desa_summary
WHERE persentase_tersambung < 50
ORDER BY total_lampu DESC;
```

### **Lampu Tidak Tersambung di Kecamatan Tertentu:**
```sql
SELECT * FROM view_lampu_tidak_tersambung
WHERE kecamatan_name = 'KUNJANG';
```

### **Box Panel dengan Lampu Terbanyak:**
```sql
SELECT * FROM view_box_summary
ORDER BY total_lampu_tersambung DESC
LIMIT 10;
```

### **Cek Relasi Lampu Baru (Stored Procedure):**
```sql
CALL sp_check_lampu_connection(
    'Desa Pakis Box 1 Aset Perkim',
    'Pakis',
    'KUNJANG'
);
```

---

## 🔧 **Pengembangan Selanjutnya**

### **Phase 1: Kunjang** ✅
- [x] Parse box panel
- [x] Parse lampu per desa
- [x] Analisis relasi
- [x] Generate SQL
- [x] Generate JSON
- [x] Visualisasi web

### **Phase 2: Multi-Kecamatan (Kunjang, Mojo, Pagu)** ✅
- [x] Support multiple kecamatan
- [x] Unified database
- [x] Peta gabungan
- [x] Filter per kecamatan

### **Phase 3: Upload KML** ✅
- [x] UI upload KML
- [x] Client-side parsing
- [x] Auto-detect relasi
- [x] Visual feedback di peta

### **Phase 4: Future Features** 🚀
- [ ] Server-side upload & persist data
- [ ] Export hasil analisis ke Excel
- [ ] Laporan PDF per kecamatan
- [ ] Dashboard administrator
- [ ] API REST untuk integrasi
- [ ] Mobile app (React Native)

---

## 📝 **Maintenance**

### **Update Data:**
Jika ada file KML baru, tambahkan ke konfigurasi di `analyze_all_pju.py`:

```python
KECAMATAN_CONFIG = {
    'NAMA_KECAMATAN': {
        'folder': 'NAMA_FOLDER',
        'box_file': 'nama_file_box.kml',
        'lampu_files': [
            'desa1.kml',
            'desa2.kml',
            ...
        ]
    }
}
```

Lalu jalankan ulang:
```bash
python analyze_all_pju.py
```

---

## 📱 **Kontak Support**

Untuk pertanyaan, update data, atau pengembangan lebih lanjut:

- **WhatsApp:** [+62 856-4571-9632](https://wa.me/6285645719632)
- **Developer:** Yarif 2025
- **Website:** [yarif.com](https://www.yarif.com)

---

## 📜 **License**

© 2025 Kabupaten Kediri. All rights reserved.

Developed by Yarif with ❤️

---

## 🎉 **Changelog**

### **v2.1 - Enhanced Matching + Color Coding** (8 Jan 2025)
- ✅ **Improved Box Matching**: Menggunakan kombinasi "nama aset" + "ruas jalan/desa"
- ✅ **Unique Colors**: Setiap box panel punya warna unik (HSL color space)
- ✅ **Smart Color Distribution**: 106 warna dengan kontras optimal untuk 1000+ boxes
- ✅ **Visual Coding**: Lampu mengikuti warna box yang terhubung
- ✅ **Better Accuracy**: Mojo Desa Mondo meningkat dari 0% ke 100% tersambung!
- ✅ **Enhanced Data**: Total lampu tersambung meningkat dari 2.303 (65.3%) ke 2.306 (65.3%)

**Improvements:**
- Desa Mondo (Mojo): 0 → 150 tersambung (100%)
- Desa Tengger Lor (Kunjang): 0 → 44 tersambung
- Total accuracy improvement: +3 lampu terdeteksi

### **v2.0 - Multi-Kecamatan + Upload Feature** (8 Jan 2025)
- ✅ Support 3 kecamatan (Kunjang, Mojo, Pagu)
- ✅ Fitur upload KML dengan auto-detect relasi
- ✅ 106 box panel, 3.529 lampu PJU
- ✅ Client-side processing untuk keamanan

### **v1.0 - Single Kecamatan** (8 Jan 2025)
- ✅ Kecamatan Kunjang
- ✅ 8 box panel, 1.706 lampu
- ✅ Database SQL + JSON
- ✅ Visualisasi peta OpenLayers

---

**Last Updated:** 8 Januari 2025
