import 'dart:io';

/// Program Konversi Mata Uang
/// Mengubah Rupiah (IDR) ke USD, EUR, JPY, GBP, atau SGD.
void main() {
  print("====================================");
  print("      Kalkulator Konversi Mata Uang");
  print("====================================");
  print("1. IDR ke USD (Dollar Amerika)");
  print("2. IDR ke EUR (Euro Eropa)");
  print("3. IDR ke JPY (Yen Jepang)");
  print("4. IDR ke GBP (Poundsterling Inggris)");
  print("5. IDR ke SGD (Dollar Singapura)");
  print("====================================");

  // Pilih jenis konversi
  stdout.write("Pilih jenis konversi (1-5): ");
  int pilihan = int.parse(stdin.readLineSync()!);

  // Input jumlah Rupiah
  stdout.write("Masukkan jumlah Rupiah (IDR): ");
  double rupiah = double.parse(stdin.readLineSync()!);

  double hasil;
  String mataUang = "";

  // Konversi sesuai pilihan
  switch (pilihan) {
    case 1:
      hasil = rupiah / 15000; // kurs contoh: 1 USD = 15.000 IDR
      mataUang = "USD (Dollar Amerika)";
      break;
    case 2:
      hasil = rupiah / 16500; // kurs contoh: 1 EUR = 16.500 IDR
      mataUang = "EUR (Euro Eropa)";
      break;
    case 3:
      hasil = rupiah / 110; // kurs contoh: 1 JPY = 110 IDR
      mataUang = "JPY (Yen Jepang)";
      break;
    case 4:
      hasil = rupiah / 19000; // kurs contoh: 1 GBP = 19.000 IDR
      mataUang = "GBP (Poundsterling Inggris)";
      break;
    case 5:
      hasil = rupiah / 11000; // kurs contoh: 1 SGD = 11.000 IDR
      mataUang = "SGD (Dollar Singapura)";
      break;
    default:
      print("Pilihan tidak valid!");
      return;
  }

  // Tampilkan hasil konversi
  print("\n====================================");
  print("           Hasil Konversi");
  print("====================================");
  print("Jumlah IDR   : Rp ${rupiah.toStringAsFixed(2)}");
  print("Hasil Konversi: ${hasil.toStringAsFixed(2)} $mataUang");
  print("====================================");
}
