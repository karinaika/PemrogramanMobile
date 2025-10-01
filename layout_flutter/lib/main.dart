import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    // Title Section (judul + lokasi + icon bintang + angka)
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            // Soal 1: Column untuk teks judul & lokasi
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Soal 2
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung di Batu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(
                    color: Colors.grey, // Soal 2 (warna teks lokasi)
                  ),
                ),
              ],
            ),
          ),
          // Soal 3: icon bintang dan angka
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    // Praktikum 2: Button Section
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Praktikum 3: Text Section
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Gunung Panderman adalah sebuah gunung di Kota Batu, Jawa Timur, Indonesia, dengan puncak Basundara yang berketinggian 2.045 mdpl. '
        '\nKetinggian: 2.045 m '
        '\nKoordinat: 7°54′15″S 112°29′48″E / 7.9042°S 112.4967°E '
        '\n\nNama : Karina Ika Indasa '
        '\nNIM :2341760042',
        softWrap: true, 
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: KARINA IKA 2341760042',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/panderman.jpeg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
              ),
            titleSection,   // Praktikum 1
            buttonSection,  // Praktikum 2
            textSection,    // Praktikum 3
          ],
        ),
      ),
    );
  }

  // Method helper untuk membuat kolom tombol
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
