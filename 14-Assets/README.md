# ASSETS
Assets, File yang di bundled dan di deployed bersamaan dengan aplikasi. Ada beberapa tipe Assets yaitu :
1. Static Data (JSON files)
2. Icons
3. Images
4. Font file (ttf) untuk Menentukan Assets, yaitu:
5. Menggunakan pubspec.yaml
6. Pubspec.yaml terletak pada root project untuk mengidentifikasi assets yang dibutuhkan aplikasi
7. Gunakan karakter "/" untuk memasukkan semua assets dibawah satu directory name

IMAGES, Membuat tampilan lebih menarik, Mendukung format JPEG, WebP, GIF, Animaed Web/GIF, PNG, BMP dan WBMP dan Menampilkan gambar dari project asset dan internet

### Loading Images
1. menggunakan widget Image
2. Membutuhkan property image dengan class AssetImage()
3. Menambahkan image ke folder assets (lebih CPU friendly & cepat)
4. Menggunakan method Image.asset, mendapatkan image yang sudah ditambahkan dalam project
5. Menggunakan method Image.network, mendapatkan data image melalui internet dengan menggunakan string URLnya FONT, Penentuan oleh UI Designer, Keunikan pada apk dan Penerapan font menggunakan custom font atau dari package
