# Tugas 7 PBP

Nama    : Ratu Nadya Anjania
Kelas   : PBP F
NPM     : 2206029752

## Jawaban

### Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

- ***Stateless widget*** adalah widget yang keadaannya bersifat **statis** atau tidak berubah. Contoh _stateless widget_: `IconButton`, `Text`. Sebaliknya, ***Stateful widget*** bersifat **dinamis**. Sebagai contoh, ketika pengguna berinteraksi dengan _stateful widget_ atau _widget_ menerima data, _widget_ dapat berubah (misal tampilannya berubah). Contoh _stateful widget_ antara lain: `Checkbox`, `InkWell`, `Form`, dan sebagainya.
 
### Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

| **Widget**                   | **Fungsi**                                                                                                  |
|------------------------------|-------------------------------------------------------------------------------------------------------------|
| MyApp                        | _Root widget_ dari aplikasi.                                                                                |
| MaterialApp                  | Mengatur tema aplikasi.                                                                                     |
| MyHomePage (_StatelessWidget | Tampilan utama (_home screen_).                                                                             |
| FundraisingCard              | Menampilkan setiap FundraisingItem yang jika ditekan menampilkan Snackbar.                                  |
| FundraisingItem              | Merepresentasikan item penggalangan dana._                                                                  |
| Scaffold                     | Mengatur tata letak komponen aplikasi.                                                                      |
| SingleChildScrollView        | _Widget wrapper_ yang membungkus konten utama dan dapat di-_scroll_.                                        |
| Padding                      | Mengatur padding.                                                                                           |
| Column                       | Menampilkan children secara vertikal.                                                                       |
| Text                         | Menampilkan tulisan dengan _style_ dan _alignment_ yang sesuai.                                             |
| GridView.count               | Menampilkan _item grid_ dalam jumlah kolom yang telah ditentukan.                                           |
| Container                    | _Widget_ yang bertindak sebagai '_box_' yang menampung widget lain dan mengatur tampilan atau _layout_-nya. |
| Icon                         | _Widget_ simbol grafis yang merepresentasikan suatu fungsi atau konten.                                     |
| InkWell                      | _Widget_ yang responsif terhadap sentuhan pengguna.                                                         |
| Center                       | Mengatur posisi children ke tengah.                                                                         |
| Snackbar                     | Menampilkan pesan _pop-up_ bahwa tombol ditekan.                                                            |

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

- **Membuat sebuah program Flutter baru**
  - Membuat direktori baru
  - Membuka terminal di direktori tersebut
  - Menjalankan command `flutter create don8`.

- **Membuat tiga tombol sederhana**
  - Membuat kelas `FundraisingCard` dan `FundraisingItem`
  - Membuat list item bertipe `FundraisingItem` yang berisi ketiga tombol.
  - Menambahkan properti `color` dan menambahkan parameter tiga warna berbeda pada masing-masing item/tombol.
  - Memanfaatkan `FundraisingCard` untuk menampilkan item-item.

- **Memunculkan `SnackBar` dengan tulisan**
    - Menggunakan widget `InkWell` yang responsif terhadap sentuhan pengguna. Ketika card ditekan, SnackBar akan di-_trigger_ untuk muncul. 
    - Tulisan dimunculkan dengan memanfaatkan properti `onTap` yang memanggil `ScaffoldMessenger` yang di dalamnya terdapat metode `showSnackBar()` yang menampilkan tulisan.