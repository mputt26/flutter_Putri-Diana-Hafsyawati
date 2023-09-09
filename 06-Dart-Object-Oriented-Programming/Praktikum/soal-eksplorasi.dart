class Buku {
  int id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);

  @override
  String toString() {
    return 'ID: $id, Judul: $judul, Penerbit: $penerbit, Harga: $harga, Kategori: $kategori';
  }
}

class TokoBuku {
  List<Buku> daftarBuku = [];
  int _nextId = 1;

  void tambahBuku(String judul, String penerbit, double harga, String kategori) {
    Buku buku = Buku(_nextId, judul, penerbit, harga, kategori);
    daftarBuku.add(buku);
    _nextId++;
  }

  List<Buku> semuaBuku() {
    return daftarBuku;
  }

  void hapusBuku(int id) {
    daftarBuku.removeWhere((buku) => buku.id == id);
  }
}

void main() {
  TokoBuku toko = TokoBuku();

  toko.tambahBuku('Buku 1', 'Penerbit A', 19.99, 'Fiksi');
  toko.tambahBuku('Buku 2', 'Penerbit B', 14.99, 'Non-Fiksi');
  toko.tambahBuku('Buku 3', 'Penerbit C', 24.99, 'Fiksi');

  print('Daftar Buku:');
  for (var buku in toko.semuaBuku()) {
    print(buku);
  }

  toko.hapusBuku(2);

  print('\nSetelah Menghapus Buku 2:');
  for (var buku in toko.semuaBuku()) {
    print(buku);
  }
}
