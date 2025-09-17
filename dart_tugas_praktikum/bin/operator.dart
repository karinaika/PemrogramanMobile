import 'dart:io';

/// Program Demo Operator di Dart (versi input pengguna)
/// User memasukkan dua angka, lalu ditampilkan hasil operator.
void main() {
  print("====================================");
  print("      Demo Operator dengan Input");
  print("====================================");

  // Minta input angka pertama
  stdout.write("Masukkan angka pertama (a): ");
  int a = int.parse(stdin.readLineSync()!);

  // Minta input angka kedua
  stdout.write("Masukkan angka kedua (b): ");
  int b = int.parse(stdin.readLineSync()!);

  print("\n====================================");
  print("       Hasil Operasi dengan a=$a, b=$b");
  print("====================================");

  // Operator Aritmatika
  print("\n--- Operator Aritmatika ---");
  print("a + b = ${a + b}");
  print("a - b = ${a - b}");
  print("a * b = ${a * b}");
  print("a / b = ${(a / b).toStringAsFixed(2)}"); // format 2 desimal
  print("a % b = ${a % b}");

  // Operator Relasional
  print("\n--- Operator Relasional ---");
  print("a > b   : ${a > b}");
  print("a < b   : ${a < b}");
  print("a >= b  : ${a >= b}");
  print("a <= b  : ${a <= b}");
  print("a == b  : ${a == b}");
  print("a != b  : ${a != b}");

  // Operator Logika (contoh dengan boolean tetap)
  bool x = true, y = false;
  print("\n--- Operator Logika ---");
  print("x = $x, y = $y");
  print("x && y : ${x && y}");
  print("x || y : ${x || y}");
  print("!x     : ${!x}");

  // Operator Penugasan
  int c = a; // mulai dari nilai a
  print("\n--- Operator Penugasan (c mulai dari a=$a) ---");
  print("c = $c");
  c += b; // tambah b
  print("c += b -> $c");
  c -= b; // kurang b
  print("c -= b -> $c");
  c *= b; // kali b
  print("c *= b -> $c");
  c ~/= (b == 0 ? 1 : b); // bagi b (hindari error bagi nol)
  print("c ~/= b -> $c");

  // Operator Increment & Decrement
  int d = a;
  print("\n--- Increment & Decrement (d mulai dari a=$a) ---");
  print("d++    = ${d++} (post-increment, tampilkan dulu baru tambah 1)");
  print("++d    = ${++d} (pre-increment, tambah 1 dulu baru tampilkan)");
  print("d--    = ${d--} (post-decrement, tampilkan dulu baru kurang 1)");
  print("--d    = ${--d} (pre-decrement, kurang 1 dulu baru tampilkan)");

  // Operator Bitwise
  print("\n--- Operator Bitwise ---");
  print("a & b = ${a & b}   // AND bitwise");
  print("a | b = ${a | b}   // OR bitwise");
  print("a ^ b = ${a ^ b}   // XOR bitwise");
  print("~a    = ${~a}      // NOT bitwise");
  print("a << 1 = ${a << 1} // geser kiri (kali 2)");
  print("a >> 1 = ${a >> 1} // geser kanan (bagi 2)");

  print("\n====================================");
  print("      Selesai Demo Operator");
  print("====================================");
}
