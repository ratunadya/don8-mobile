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
| MyHomePage (_StatelessWidget_) | Tampilan utama (_home screen_).                                                                             |
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
  - Membuat direktori baru.
  - Membuka terminal di direktori tersebut.
  - Menjalankan command `flutter create don8`.

- **Membuat tiga tombol sederhana**
  - Membuat kelas `FundraisingCard` dan `FundraisingItem`.
  - Membuat list item bertipe `FundraisingItem` yang berisi ketiga tombol.
  - Menambahkan properti `color` dan menambahkan parameter tiga warna berbeda pada masing-masing item/tombol.
  - Memanfaatkan `FundraisingCard` untuk menampilkan item-item.

- **Memunculkan `SnackBar` dengan tulisan**
    - Menggunakan widget `InkWell` yang responsif terhadap sentuhan pengguna. Ketika card ditekan, SnackBar akan di-_trigger_ untuk muncul. 
    - Tulisan dimunculkan dengan memanfaatkan properti `onTap` yang memanggil `ScaffoldMessenger` yang di dalamnya terdapat metode `showSnackBar()` yang menampilkan tulisan.

***

# Tugas 8 PBP

## Jawaban

### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
  
- Perbedaan utama keduanya terdapat pada perlakuan terhadap _route_ di atas _stack_. `Navigator.push()` **menambahkan** _route_ baru di atas _route_ yang sebelumnya ada di atas _stack_. Sementara itu, `Navigator.pushReplacement()` **mengganti** _route_ yang adaa di atas stack dengan _route_ baru.

- **Contoh:**

  * Method `push()`
    ```
    ...
      if (item.name == "Tambah Penggalangan Dana") {
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FundraisingFormPage()));
      }
    ...      
    ```

      Sebagai contoh, saat ini route yang sedang ditampilkan adalah MyHomePage(). Ketika _button_ (dalam kode `item`) `Tambah Penggalangan Dana` ditekan, method `push()` akan menyebabkan _route_ yang ditambahkan, yaitu `MaterialPageRoute` yang mencakup `FundraisingFormPage()`, berada di paling atas stack sehingga _route_ tersebutlah yang akan ditampilkan kepada pengguna. 
      
      Selain itu, karena kita menggunakan `push()`, jika terdapat tombol `Back` yang memanfaatkan method `pop()`, pengguna dapat kembali ke halaman menu karena _route_ sebelumnya masih ada di dalam _stack_, tepatnya di bawah _route_ yang sedang ditampilkan.

  * Method `pushReplacement`

    ```
    ...
      onTap: () {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(),
          ));
      },
    ...
    ```

    Pada kode, method `pushReplacement()` akan menggantikan _route_ yang saat ini sedang ditampilkan dengan _route_ baru yaitu, `MyHomePage()`. Dalam kasus ini, ketika pengguna menekan tombol `Back` yang memanfaatkan method `pop()` (jika ada), pengguna tidak akan kembali ke _route_ yang sebelumnya ditampilkan karena _route_ tersebut sudah dihapus dan diganti dengan yang baru. Hal yang dapat terjadi dalam kasus tersebut adalah pengguna pindah ke _route_ di bawah _route_ yang sekarang atau keluar dari aplikasi jika tidak ada _route_ lagi di bawahnya.

###  Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
  
| ***Layout Widget*** | **Konteks Penggunaan**                                                                                            |
|---------------------|-------------------------------------------------------------------------------------------------------------------|
| Align               | Mengatur (_align_) letak _child_ (tombol `Save` dalam `Elevated Button`) di bagian bawah tengah _layout_ halaman. |
| Center              | Mengatur posisi _widget_ ke tengah.                                                                               |
| Container           | Menampung dan mengatur dekorasi, ukuran, warna, dan posisi _widget_ di dalamnya.                                  |
| Padding             | Mengatur jarak atau ruang kosong dari keliling _widget input field_.                                              |
| GridView.count      | Menampilkan _item-item_ `FundraisingItem` dalam bentuk grid.                                                      |
| ListView            | Digunakan di dalam _drawer_ untuk menampilkan `ListTile` yang berisi menu navigasi secara linear.                 |
| Row                 | Menampilkan _widget_ secara horizontal.                                                                           |
| Column              | Menampilkan _widget_ secara vertikal.                                                                             |

### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
  
| **Elemen Input**                      | **Alasan**                                                                                                                                                                                                                                 |
|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| TextFormField(Nama Penggalangan Dana) | Digunakan untuk mengambil dan menyimpan _input_ nama dari penggalangan dana.                                                                                                                                                               |
| TextFormField(Nominal Target)         | Dipakai untuk mengambil dan menyimpan _input_ besar nominal target yang perlu diraih dalam penggalangan dana.                                                                                                                              |
| TextFormField(Deskripsi)              | Diperlukan untuk mengambil dan menyimpan _input_ penjelasan lebih lanjut terkait penggalangan dana.                                                                                                                                        |
| DropdownButtonFormField(Kategori)     | Digunakan untuk menampilkan pilihan kategori penggalangan dana dan menyimpan _input_nya. Dropdown efektif untuk menampilkan pilihan, terutama dalam jumlah yang banyak. Melalui kategorisasi, penggalangan dana dapat lebih mudah diakses. |

### Bagaimana penerapan _clean architecture_ pada aplikasi Flutter?
  
Pada aplikasi Flutter, _clean architecture_ diterapkan dengan melakukan organisasi struktur kode yang baik dan memisahkan tugas sesuai fungsi atau peran masing-masing. Misalnya dengan memisahkan kode yang mengatur logika (_domain_), data, dan tampilan (_presentation_) dalam bagian terpisah.

###  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
  
- **Membuat halaman formulir tambah penggalangan dana baru**
  - Membuat berkas `fundraising_form.dart` dan membuat widget `FundraisingFormPage`, `Form`, `SingleChildScrollView` yang digunakan untuk _input field widget_.
  - Membuat dan menambahkan variabel `_formKey` ke dalam atribut key milik _widget_ `Form` sebagai handler dari form state, validasi form, dan penyimpanan form.
  - Membuat variabel untuk menyimpan _input_ masing-masing _field_ juga list kategori untuk _dropdown input_ kategori.
  - Membuat widget `Column` yang _children_-nya merupakan `Padding` yang mempunyai _child_ widget-widget _input form field_ seperti `TextFormField` dan `DropdownButtonFormField`.
  - Mengimplementasikan validasi sesuai ketentuan soal.
  - Membuat tombol `Save` yang menampilkan pop-up data item.


- **Mengarahkan pengguna ke halaman form tambah penggalangan dana baru ketika menekan tombol Tambah Penggalangan Dana pada halaman utama**
  - Menambahkan kondisi yang memeriksa apakah tombol yang ditekan merupakan tombol `Tambah Penggalangan Dana`pada atribut `onTap()` dari `InkWell`.
  - Menggunakan method `Navigator.push()` untuk menambahkan _route_ baru (`MaterialPageRoute()` yang mencakup `FundraisingFormPage()`) di atas _stack_ sehingga pengguna akan diarahkan ke halaman form tersebut setelah menekan tombol.

- **Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru**
  - Menambahkan fungsi `showDialog()` pada `onPressed()` widget `ElevatedButton()`.
  - Memunculkan widget `AlertDialog` pada fungsi tersebut.

- **Membuat sebuah _drawer_ pada aplikasi**
  - Membuat berkas `left_drawer.dart` di direktori `widgets`.
  - Melakukan impor halaman-halaman yang navigasinya ingin dimasukkan ke menu _drawer_.
  - Memanfaatkan widget `ListView` untuk menampilkan `ListTile` yang berisi menu navigasi secara linear.
  - Memodifikasi atribut onTap() agar dapat melakukan navigasi ke halaman yang ingin dituju dengan memanfaatkan method `Navigator.pushReplacement()`.

  ***

# Tugas 9 PBP

## Jawaban

### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

- Ya, bisa tetapi tidak direkomendasikan. 
- Tidak, akan lebih baik jika kita menggunakan data yang sudah di-_parse_ ke model dibandingkan dengan menggunakan raw `JSON`. Penggunaan model akan membuat lebih terstruktur.
 
### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

`CookieRequest` digunakan untuk mengelola permintaan (_request_) HTTP yang terkait dengan autentikasi dan _session_ dengan menggunakan dependensi yang diinstal, serta memberikan fungsionalitas autentikasi berbasis _cookie_ untuk aplikasi Flutter kepada _backend_ Django.

### Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

- Fetch data dari API _endpoint_.
- Data yang didapat di-_decode_ menjadi bentuk `JSON`.
- Data dalam bentuk `JSON` di-_convert_ menjadi bentuk model.
- Data dalam bentuk model dapat digunakan pada aplikasi Flutter.

### Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

- Aplikasi meminta input _username_ dan _password_. 
- Dart mengakses suatu URL yang mengarahkan ke Django. 
- Pada fungsi Django, _request_ dan argumen yang diterima dari Dart akan digunakan untuk proses otentikasi username dan password di Django.
- Respons akan dikembalika dalam format `JSON` berdasarkan hasil otentikasi. 
- Jika valid, fungsi Django akan memberikan respons kepada Dart bahwa pengguna dapat _login_.
- Jika gagal, fungsi Django akan memberikan respons kepada Dart bahwa pengguna gagal _login_.
 
### Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

| **Widget**       | **Fungsi**                                                                                   |
|------------------|----------------------------------------------------------------------------------------------|
| Container        | Sebagai '_box_' yang menampung _widget_ lain dan mengatur tampilan atau _layout_-nya.        |
| Column           | Menampilkan children secara vertikal.                                                        |
| Center           | Mengatur tampilan `ElevatedButton` di tengah-tengah halaman rincian _item_.                  |
| Text             | Menampilkan teks.                                                                            |
| Icon             | Menampilkan simbol grafis panah yang merepresentasikan fungsi kembali ke halaman sebelumnya. |
| AppBar           | Menampilkan judul _item_.                                                                    |
| Scaffold         | Struktur dasar halaman.                                                                      |
| MaterialApp      | Berfungsi saat ingin menggunakan _material design_.                                          |
| ListView.builder | Menampilkan _list of children_ yang dapat di-_scroll_.                                       |
| SizedBox         | Membuat ruang kosong vertikal di antara teks-teks.                                           |
| ElevatedButton   | Untuk tombol kembali ke halaman daftar _item_.                                               |
| Padding          | Menambahkan ruang di sekeliling `Column`.                                                    |
 
### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

- **Memastikan _deployment_ proyek tugas Django kamu telah berjalan dengan baik**

    - Memeriksa _deployment_ pada laman `Actions` Github.
    - `Re-run all jobs` ketika gagal.
 
- **Membuat halaman login pada proyek tugas Flutter**
    
    Pada **Django**,
    - Buat fungsi _login_ pada `authentication/views.py`.
    - Menambahkan URL _routing_-nya.
    - Menambahkan _path_ `auth` ke _file_ `urls.py` aplikasi.

    Pada **Flutter**,
    - Buat file `login.dart` beserta _widget-widget_ dan fungsi validasinya.
    - Sesuaikan _widget_ `MaterialApp(...)` menjadi `home: LoginPage()`.
    
- **Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter**
    - Setup autentikasi pada Django untuk Flutter.
    - Install _package_ `provider` dan `pbp_django_auth`.
    - Modifikasi _root widget_ agar dapat menyediakan `CookieRequest` ke semua _child widgets_.

- **Membuat model kustom sesuai dengan proyek aplikasi Django**
    - Salin data `JSON` yang didapatkan dari mengakses _endpoint_ `JSON`.
    - Tempel data `JSON` pada textbox situs web `Quicktype` yang sudah di-_setup_ _name, source type, dan language_-nya.
    - Klik `Copy Code`.
    - Buat _folder_ `models` dan _file_ `item.dart` dan tempel kode yang sudah disalin.

- **Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy**
    - Buat _file_  `list_item.dart`.
    - Impor _library_ yang dibutuhkan.
    - Lakukan _fetch data_ dari Django pada _file_ tersebut.
    
- **Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item**
    - Buat _file_ `item_details.dart`.
    - Modifikasi `ListView.builder` di `ItemPage` supaya item dapat di-klik.
    - Manfaatkan _widget_ `InkWell` untuk membungkus setiap _item_ dalam daftar dan modifikasi agar ketika _item_ di-_tap_ (onTap), item akan menavigasi ke halaman rincian _item_, lalu meneruskan objek Item terkait untuk menampilkan detailnya.
    - Lakukan impor yang diperlukan.
