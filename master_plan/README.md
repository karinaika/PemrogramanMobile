# 📱 Laporan Praktikum Pemrograman Mobile  

## Jobsheet 10 : Dasar State Manaagement

---

## 🙋‍♀️ Identitas  
- **Nama**  : Karina Ika Indasa  
- **NIM**   : 2341760042  
- **Kelas** : SIB-3C  
- **Mata Kuliah** : Pemrograman Mobile  

---

## 📝 Langkah Praktikum
### Praktikum 1: Dasar State dengan Model-View
- Langkah 1: Buat Project Baru

- Langkah 2: Membuat model task.dart

  ![new_flutter](images/P1langkah2.png)

- Langkah 3: Buat file plan.dart

  ![new_flutter](images/P1langkah3.png)

- Langkah 4: Buat file data_layer.dart

  ![new_flutter](images/P1langkah4.png)

- Langkah 5: Pindah ke file main.dart

  ![new_flutter](images/P1langkah5.png)

- Langkah 6: Buat file plan_screen.dart

  ![new_flutter](images/P1langkah6.png)

- Langkah 7: buat method _buildAddTaskButton()*

  ![new_flutter](images/P1langkah7.png)

- Langkah 8: buat widget _buildList()

  ![new_flutter](images/P1langkah8.png)

- Langkah 9: buat widget _buildTaskTile

  ![new_flutter](images/P1langkah9.png)

- Run

  ![new_flutter](images/P1run.png)

- Langkah 10: Tambah Scroll Controller

  ![new_flutter](images/P1langkah10.png)

- Langkah 11: Tambah Scroll Listener

  ![new_flutter](images/P1langkah11.png)

- Langkah 12: Tambah controller dan keyboard behavior

  ![new_flutter](images/P1langkah12.png)

- Langkah 13: Terakhir, tambah method dispose()

  ![new_flutter](images/P1langkah13.png)

- Langkah 14: Hasil

  ![new_flutter](images/P1langkah14.png)

---

### Tugas Praktikum 1: Dasar State dengan Model-View
**1. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?**

Jawab: Berfungsi sebagai penghubung (data aggregator) antara seluruh model yang ada di folder models. Mengapa dilakukan demikian:

- Untuk mempermudah pengelolaan data layer, terutama saat model bertambah banyak.
- Membuat struktur proyek lebih bersih dan modular, sesuai prinsip clean architecture.
- Mengurangi redundancy dalam proses import di file lain (misalnya di plan_screen.dart).

**2.	Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?**

Jawab: 

Fungsinya:
- Variabel plan digunakan untuk menyimpan dan memanipulasi daftar tugas (tasks) yang dibuat oleh pengguna.
- Nilai plan akan selalu berubah setiap kali user menambah tugas baru, mengedit deskripsi, atau mencentang tugas selesai.

Mengapa dibuat const (konstanta):
- Karena nilai awal Plan() bersifat immutable (tidak berubah) saat pertama kali dibuat.
- Flutter menggunakan const agar objek tidak dibuat ulang di memori setiap kali widget di-rebuild, sehingga lebih efisien dan hemat performa.
- Ketika ada perubahan (misalnya tambah tugas), objek Plan lama akan diganti dengan objek Plan baru menggunakan setState().

**3. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!**

Jawab: Menampilkan setiap tugas dalam bentuk ListTile berisi:

- Checkbox → untuk menandai apakah tugas sudah selesai (task.complete).
- TextFormField → untuk mengubah deskripsi tugas (task.description).

Saat user mengetik atau mencentang tugas, fungsi setState() akan dipanggil untuk:
- Membuat objek Plan baru dengan daftar tugas yang sudah diperbarui.
- Menampilkan langsung perubahan di layar tanpa restart aplikasi.

**4. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?**

Jawab: 

Langkah 11 – initState()
- Dipanggil sekali saja saat widget pertama kali dibuat.
- Di sini digunakan untuk menginisialisasi ScrollController dan menambahkan listener yang otomatis menutup keyboard saat pengguna melakukan scroll.
- Ini menjaga agar tampilan tetap rapi dan tidak menutupi teks di bagian bawah layar.

Langkah 13 – dispose()
- Dipanggil saat widget dihapus dari tree (misalnya berpindah halaman).
- Digunakan untuk membersihkan resource yang digunakan controller, mencegah memory leak.
- Ini bagian penting dari siklus hidup (lifecycle) widget StatefulWidget.
