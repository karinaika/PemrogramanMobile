void main() {
  Map<String, int> nilaiMahasiswa = {
    'Matematika': 85,
    'Fisika': 75,
    'Pemrograman': 90,
  };

  double total = 0;

  // Hitung total nilai
  nilaiMahasiswa.forEach((matkul, nilai) {
    total += nilai;
  });

  // Hitung rata-rata
  double rataRata = total / nilaiMahasiswa.length;

  // Tentukan status kelulusan
  String status = rataRata >= 60 ? 'LULUS' : 'TIDAK LULUS';

  // Tentukan predikat
  String predikat;
  if (rataRata >= 90) {
    predikat = 'A';
  } else if (rataRata >= 80) {
    predikat = 'B';
  } else if (rataRata >= 70) {
    predikat = 'C';
  } else {
    predikat = 'D/E';
  }

  // Output
  print('Rata-rata: $rataRata');
  print('Status: $status');
  print('Predikat: $predikat');
}
