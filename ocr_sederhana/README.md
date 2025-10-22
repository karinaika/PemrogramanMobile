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

**Langkah 3: Tambahkan Izin Kamera (Android)**
- Buka file: android/app/src/main/AndroidManifest.xml
Tambahkan baris berikut di dalam tag <manifest>, sebelum <application>:

```xml
<uses - permission  android:name =" android . permission . CAMERA "  / >
```

  ![new_flutter](images/langkah3.png)

**Langkah 4: Buat Struktur Folder**
- Di dalam folder lib/, buat struktur berikut:

```css
lib/
├── main.dart
└── screens/
    ├── splash_screen.dart
    ├── home_screen.dart
    ├── scan_screen.dart
    └── result_screen.dart
```

  ![new_flutter](images/langkah4.png)

**Kode Program**
- File: lib/main.dart

```dart
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OCR Sederhana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
```

  ![new_flutter](images/langkah5_1.png)

- File: lib/screens/splash_screen.dart

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Setelah 2 detik, pindah ke halaman HomeScreen
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(color: Colors.white),
            SizedBox(height: 20),
            Text(
              'OCR Scanner',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
  ![new_flutter](images/langkah5_2.png)

- File: lib/screens/home_screen.dart

```dart
import 'package:flutter/material.dart';
import 'scan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigasi ke halaman ScanScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ScanScreen()),
            );
          },
          child: const Text('Mulai Scan Teks'),
        ),
      ),
    );
  }
}
```

  ![new_flutter](images/langkah5_3.png)

- File: lib/screens/scan_screen.dart

```dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path_provider/path_provider.dart';
import 'result_screen.dart';

late List<CameraDescription> cameras;

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  CameraController? _controller; // gunakan nullable agar aman
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  /// Inisialisasi kamera
  void _initCamera() async {
    try {
      cameras = await availableCameras();
      _controller = CameraController(
        cameras.first,
        ResolutionPreset.medium,
      );

      _initializeControllerFuture = _controller!.initialize();
      await _initializeControllerFuture;

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  /// Proses OCR dari file gambar
  Future<String> _ocrFromFile(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    textRecognizer.close();
    return recognizedText.text;
  }

  /// Ambil foto lalu pindah ke halaman hasil
  Future<void> _takePicture() async {
    if (_controller == null) return;

    try {
      await _initializeControllerFuture;

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Memproses OCR, mohon tunggu...'),
          duration: Duration(seconds: 2),
        ),
      );

      final XFile image = await _controller!.takePicture();
      final ocrText = await _ocrFromFile(File(image.path));

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(ocrText: ocrText),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Jika controller belum siap, tampilkan loading
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamera OCR'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: CameraPreview(_controller!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _takePicture,
              icon: const Icon(Icons.camera_alt, color: Colors.white),
              label: const Text(
                'Ambil Foto & Scan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

  ![new_flutter](images/langkah5_4.png)

  ![new_flutter](images/langkah5_41.png)

  ![new_flutter](images/langkah5_42.png)

- File: lib/screens/result_screen.dart

```dart
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String ocrText;

  const ResultScreen({super.key, required this.ocrText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil OCR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SelectableText(
            ocrText.isEmpty
                ? 'Tidak ada teks ditemukan.'
                : ocrText.replaceAll('\n', ' '),
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
```

  ![new_flutter](images/langkah5_5.png)

- Run

https://github.com/user-attachments/assets/92d0c2dd-0215-402d-a1d6-bb16fa906645

---

## 📝 UTS - Aplikasi OCR
**Soal 1:	Modifikasi Struktur Navigasi dan Aliran (30 Poin)**
- **1.Pengubahan Navigasi Home (15 Poin)**

  ![UTS](images/UTS_1.jpg)

- **2.Teks Utuh dan Navigasi Balik (15 Poin)**

  ![UTS](images/UTS_2.jpg)

  ![UTS](images/UTS_3.jpg)

**Soal 2:	Penyesuaian Tampilan dan Penanganan State/Error (40 Poin)**
- **1.Custom Loading Screen di ScanScreen (20 Poin):**

  ![UTS](images/UTS_4.jpg)

- **2.Spesifikasi Pesan Error (20 Poin)**

  ![UTS](images/UTS_5.jpg)
