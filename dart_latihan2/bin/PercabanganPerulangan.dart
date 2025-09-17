// Program menampilkan tabel perkalian dengan format berbeda
// menggunakan percabangan (if-else) dan perulangan (for).
void main() {
  int angka = 7; // angka yang akan dibuat tabel perkalian

  // Jika angka kecil (<= 5), tampilkan format sederhana
  if (angka <= 5) {
    print("Tabel perkalian $angka (format sederhana):");
    for (int i = 1; i <= 10; i++) {
      print("$angka x $i = ${angka * i}");
    }
  } 
  // Jika angka besar (> 5), tampilkan format tabel dengan highlight
  else {
    print("Tabel perkalian $angka (format tabel):");
    print("--------------------------------------");

    for (int i = 1; i <= 10; i++) {
      String hasil = "$angka x $i = ${angka * i}";

      // Percabangan tambahan → beri tanda khusus jika hasil genap
      if ((angka * i) % 2 == 0) {
        print("$hasil  <-- genap");
      } else {
        print(hasil);
      }
    }
  }
}