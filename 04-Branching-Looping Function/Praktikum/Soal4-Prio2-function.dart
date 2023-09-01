// Buatlah sebuah function dengan parameter untuk menghitung luas lingkaran. kemudian function lingkaran tersebut dijalankan pada function main!
void main() {
  double jariJari = 5.0; // Ubah jari-jari sesuai keinginan

  double luas = hitungLuasLingkaran(jariJari);
  print('Luas lingkaran dengan jari-jari $jariJari adalah: $luas');
}

double hitungLuasLingkaran(double jariJari) {
  return 3.14 * jariJari * jariJari;
}
