import 'dart:io';

/// Program Konversi Unit
/// Menyediakan konversi Panjang, Massa, Volume, dan Suhu.
/// Setiap kategori memiliki minimal 5 unit.
void main() {
  while (true) {
    print("====================================");
    print("        Program Konversi Unit");
    print("====================================");
    print("1. Panjang");
    print("2. Massa");
    print("3. Volume");
    print("4. Suhu");
    print("5. Keluar");
    print("====================================");

    stdout.write("Pilih kategori (1-5): ");
    int pilihan = int.parse(stdin.readLineSync()!);

    if (pilihan == 5) {
      print("Terima kasih, program selesai.");
      break;
    }

    switch (pilihan) {
      case 1:
        konversiPanjang();
        break;
      case 2:
        konversiMassa();
        break;
      case 3:
        konversiVolume();
        break;
      case 4:
        konversiSuhu();
        break;
      default:
        print("Pilihan tidak valid!");
    }
  }
}

/// ==========================
/// Konversi Panjang
/// ==========================
void konversiPanjang() {
  Map<String, double> panjang = {
    "m"   : 1,        // meter
    "cm"  : 0.01,     // centimeter
    "mm"  : 0.001,    // millimeter
    "km"  : 1000,     // kilometer
    "inch": 0.0254    // inch
  };

  print("\n--- Konversi Panjang ---");
  print("Unit tersedia:");
  print("m (meter), cm (centimeter), mm (millimeter), km (kilometer), inch (inci)");

  stdout.write("Masukkan nilai: ");
  double nilai = double.parse(stdin.readLineSync()!);

  if (nilai < 0) {
    print("Nilai tidak boleh negatif!");
    return;
  }

  stdout.write("Dari unit: ");
  String dari = stdin.readLineSync()!;
  stdout.write("Ke unit: ");
  String ke = stdin.readLineSync()!;

  if (!panjang.containsKey(dari) || !panjang.containsKey(ke)) {
    print("Unit tidak valid!");
    return;
  }

  double hasil = nilai * (panjang[dari]! / panjang[ke]!);

  print("====================================");
  print("$nilai $dari = ${hasil.toStringAsFixed(2)} $ke");
  print("====================================\n");
}

/// ==========================
/// Konversi Massa
/// ==========================
void konversiMassa() {
  Map<String, double> massa = {
    "kg" : 1,        // kilogram
    "g"  : 0.001,    // gram
    "mg" : 0.000001, // milligram
    "lb" : 0.4536,   // pound
    "oz" : 0.02835   // ounce
  };

  print("\n--- Konversi Massa ---");
  print("Unit tersedia:");
  print("kg (kilogram), g (gram), mg (milligram), lb (pound), oz (ons/ounce)");

  stdout.write("Masukkan nilai: ");
  double nilai = double.parse(stdin.readLineSync()!);

  if (nilai < 0) {
    print("Nilai tidak boleh negatif!");
    return;
  }

  stdout.write("Dari unit: ");
  String dari = stdin.readLineSync()!;
  stdout.write("Ke unit: ");
  String ke = stdin.readLineSync()!;

  if (!massa.containsKey(dari) || !massa.containsKey(ke)) {
    print("Unit tidak valid!");
    return;
  }

  double hasil = nilai * (massa[dari]! / massa[ke]!);

  print("====================================");
  print("$nilai $dari = ${hasil.toStringAsFixed(2)} $ke");
  print("====================================\n");
}

/// ==========================
/// Konversi Volume
/// ==========================
void konversiVolume() {
  Map<String, double> volume = {
    "l"  : 1,     // liter
    "ml" : 0.001, // milliliter
    "m3" : 1000,  // meter kubik
    "gal": 3.785, // gallon
    "cup": 0.24   // cup (gelas ukur)
  };

  print("\n--- Konversi Volume ---");
  print("Unit tersedia:");
  print("l (liter), ml (milliliter), m3 (meter kubik), gal (gallon), cup (gelas)");

  stdout.write("Masukkan nilai: ");
  double nilai = double.parse(stdin.readLineSync()!);

  if (nilai < 0) {
    print("Nilai tidak boleh negatif!");
    return;
  }

  stdout.write("Dari unit: ");
  String dari = stdin.readLineSync()!;
  stdout.write("Ke unit: ");
  String ke = stdin.readLineSync()!;

  if (!volume.containsKey(dari) || !volume.containsKey(ke)) {
    print("Unit tidak valid!");
    return;
  }

  double hasil = nilai * (volume[dari]! / volume[ke]!);

  print("====================================");
  print("$nilai $dari = ${hasil.toStringAsFixed(2)} $ke");
  print("====================================\n");
}

/// ==========================
/// Konversi Suhu
/// ==========================
void konversiSuhu() {
  print("\n--- Konversi Suhu ---");
  print("Unit tersedia:");
  print("C (Celsius), F (Fahrenheit), K (Kelvin), R (Reamur)");

  stdout.write("Masukkan nilai: ");
  double nilai = double.parse(stdin.readLineSync()!);

  stdout.write("Dari unit: ");
  String dari = stdin.readLineSync()!;
  stdout.write("Ke unit: ");
  String ke = stdin.readLineSync()!;

  double hasil;

  // Rumus konversi suhu
  if (dari == "C") {
    if (ke == "F") hasil = (nilai * 9/5) + 32;
    else if (ke == "K") hasil = nilai + 273.15;
    else if (ke == "R") hasil = nilai * 4/5;
    else hasil = nilai;
  } else if (dari == "F") {
    if (ke == "C") hasil = (nilai - 32) * 5/9;
    else if (ke == "K") hasil = (nilai - 32) * 5/9 + 273.15;
    else if (ke == "R") hasil = (nilai - 32) * 4/9;
    else hasil = nilai;
  } else if (dari == "K") {
    if (ke == "C") hasil = nilai - 273.15;
    else if (ke == "F") hasil = (nilai - 273.15) * 9/5 + 32;
    else if (ke == "R") hasil = (nilai - 273.15) * 4/5;
    else hasil = nilai;
  } else if (dari == "R") {
    if (ke == "C") hasil = nilai * 5/4;
    else if (ke == "F") hasil = (nilai * 9/4) + 32;
    else if (ke == "K") hasil = (nilai * 5/4) + 273.15;
    else hasil = nilai;
  } else {
    print("Unit tidak valid!");
    return;
  }

  print("====================================");
  print("$nilai $dari = ${hasil.toStringAsFixed(2)} $ke");
  print("====================================\n");
}
