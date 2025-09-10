void main() {
  double hargaBarang = 120000;
  int jumlahBeli = 3;
  String kodeMember = 'GOLD';

  // Hitung total harga
  double total = hargaBarang * jumlahBeli;

  // Diskon berdasarkan kode member
  double diskonPersen = 0;
  if (kodeMember == 'GOLD') {
    diskonPersen = 0.1;
  } else if (kodeMember == 'SILVER') {
    diskonPersen = 0.05;
  }

  // Diskon tambahan jika total > 300.000
  double diskonTambahan = total > 300000 ? 0.05 : 0;

  // Hitung total diskon
  double totalDiskon = total * (diskonPersen + diskonTambahan);

  // Harga akhir setelah diskon
  double hargaAkhir = total - totalDiskon;

  // Output
  print('Total: Rp$total');
  print('Diskon: Rp$totalDiskon');
  print('Akhir: Rp$hargaAkhir');
}
