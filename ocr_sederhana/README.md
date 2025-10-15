# 📱 Laporan Praktikum Pemrograman Mobile  

## Jobsheet 7 : Aplikasi OCR Sederhana dengan Flutter

---

## 🙋‍♀️ Identitas  
- **Nama**  : Karina Ika Indasa  
- **NIM**   : 2341760042  
- **Kelas** : SIB-3C  
- **Mata Kuliah** : Pemrograman Mobile  

---

## 🎯 Tujuan Praktikum  
Setelah menyelesaikan jobsheet ini, siswa/mahasiswa mampu:
1.	Membuat aplikasi Flutter multi-halaman.
2.	Menggunakan plugin kamera untuk mengambil gambar.
3.	Mengintegrasikan OCR (Optical Character Recognition) menggunakan library
google mlkit text recognition.
4.	Menampilkan hasil OCR di halaman terpisah.
5.	Menerapkan navigasi dasar antar layar menggunakan Navigator.

---

## 🛠️ ALat dan Bahan
- Laptop/komputer dengan Flutter SDK terinstal
- VS Code atau Android Studio
- Emulator Android atau perangkat Android fisik
- Koneksi internet (untuk instalasi dependensi)

---

## 📝 Langkah Praktikum
**Langkah 1: Buat Proyek baru**
- Buka terminal, lalu jalankan:

```bash
flutter  create  ocr_sederhana
cd  ocr_sederhana
```

  ![new_flutter](images/langkah1.png)

**Langkah 2: Tambahkan Plugin**
- Buka file pubspec.yaml, lalu tambahkan dependensi berikut di bawah bagian dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_mlkit_text_recognition: ^0.10.0
  camera: ^0.10.5+5
  path_provider: ^2.1.2
  path: ^1.8.3
```

  ![new_flutter](images/langkah2.png)
  ![new_flutter](images/langkah2_1.png)


