class Calculator {
  // Method untuk penjumlahan
  double tambah(double a, double b) {
    return a + b;
  }

  // Method untuk pengurangan
  double kurang(double a, double b) {
    return a - b;
  }

  // Method untuk perkalian
  double kali(double a, double b) {
    return a * b;
  }

  // Method untuk pembagian
  double bagi(double a, double b) {
    if (b == 0) {
      throw Exception("Tidak bisa membagi dengan nol");
    }
    return a / b;
  }
}

void main() {
  Calculator kalkulator = Calculator();

  double angka1 = 15.0;
  double angka2 = 5.0;

  // Penjumlahan
  double hasilTambah = kalkulator.tambah(angka1, angka2);
  print('Hasil penjumlahan: $hasilTambah');

  // Pengurangan
  double hasilKurang = kalkulator.kurang(angka1, angka2);
  print('Hasil pengurangan: $hasilKurang');

  // Perkalian
  double hasilKali = kalkulator.kali(angka1, angka2);
  print('Hasil perkalian: $hasilKali');

  // Pembagian
  try {
    double hasilBagi = kalkulator.bagi(angka1, angka2);
    print('Hasil pembagian: $hasilBagi');
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}
