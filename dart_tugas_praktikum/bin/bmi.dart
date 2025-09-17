import 'dart:io';

/// Program Hitung BMI (Body Mass Index)
/// Menghitung nilai BMI berdasarkan input berat (kg) dan tinggi (cm).
void main() {
  print("====================================");
  print("        Program Hitung BMI");
  print("====================================");

  stdout.write("Masukkan berat badan (kg): "); // stdout.write untuk meminta input dari pengguna
  double berat = double.parse(stdin.readLineSync()!); // baca input & ubah ke double

  stdout.write("Masukkan tinggi badan (cm): "); // stdout.write untuk meminta input dari pengguna
  double tinggiCm = double.parse(stdin.readLineSync()!); // baca input cm
  double tinggiM = tinggiCm / 100; // konversi cm ke meter

  // Rumus BMI = berat / (tinggi * tinggi)
  double bmi = berat / (tinggiM * tinggiM);

  print("\n====================================");
  print("            Hasil Hitung BMI");
  print("====================================");
  print("Berat Badan : ${berat.toStringAsFixed(1)} kg");     // toStringAsFixed(1) -> format 1 angka desimal
  print("Tinggi Badan: ${tinggiCm.toStringAsFixed(1)} cm"); // tampilkan tinggi dengan 1 desimal
  print("BMI         : ${bmi.toStringAsFixed(2)}");         // tampilkan BMI dengan 2 desimal

  // Tentukan kategori BMI berdasarkan nilai
  String kategori;
  if (bmi < 18.5) {
    kategori = "Kurus";
  } else if (bmi < 24.9) {
    kategori = "Normal";
  } else if (bmi < 29.9) {
    kategori = "Overweight";
  } else {
    kategori = "Obesitas";
  }

  print("Kategori    : $kategori");
  print("====================================");
}
