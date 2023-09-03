// Buatlah sebuah program untuk menghitung rata-rata dari sekumpulan nilai. Lakukan pembulatan keatas untuk nilai hasil perhitungan rata-rata.

// Sampel Input: [7,5,3,5,2,1]

//  Sampel Output: 4

void main() {
  List<int> nilai = [7, 5, 3, 5, 2, 1];

  int total = 0;
  for (int nilaiSaatIni in nilai) {
    total += nilaiSaatIni;
  }

  double rataRata = total / nilai.length;

  int rataRataBulat = rataRata.ceil();

  print("Rata-rata: $rataRataBulat");
}