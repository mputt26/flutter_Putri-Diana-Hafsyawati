// Buatlah sebuah program untuk mencetak tabel perkalian.
// Sample input: 9
// sample output : hasil perkalian 9

void main() {
  for (int a = 1; a <= 9; a++) {
    String row = "";
    for (int b = 1; b <= 9; b++) {
      int hasil = a * b;
      row += "$hasil\t";
    }
    print(row);
  }
}
