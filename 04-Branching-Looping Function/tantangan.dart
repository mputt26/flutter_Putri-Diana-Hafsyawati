void main() {
  double buku = 10000;
  double pensil = 5000;
  double tas = 100000;

  double totalPembelian = 200000;
  double diskon = 0.1;

  double totalSetelahDiskon = hitungTotalSetelahDiskon(totalPembelian, diskon);
  print("Total pembelian sebelum diskon: \$${totalPembelian.toStringAsFixed(2)}");
  print("Total pembelian setelah diskon: \$${totalSetelahDiskon.toStringAsFixed(2)}");
}

double hitungTotalPembelian(double buku, double pensil, double tas) {
  return buku + pensil + tas;
}

double hitungDiskon(double totalPembelian, double diskon) {
  return totalPembelian * diskon;
}

double hitungTotalSetelahDiskon(double totalPembelian, double diskon) {
  double jumlahDiskon = hitungDiskon(totalPembelian, diskon);
  return totalPembelian - jumlahDiskon;
}
