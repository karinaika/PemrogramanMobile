/// Program mencetak pola segitiga bintang menggunakan nested loop.
void main() {
  // Loop baris (dari 1 sampai 5)
  for (int i = 1; i <= 5; i++) {
    String baris = '';

    // Loop kolom (jumlah bintang sesuai nomor baris)
    for (int j = 1; j <= i; j++) {
      baris += '* ';
    }

    print(baris);
  }
}
