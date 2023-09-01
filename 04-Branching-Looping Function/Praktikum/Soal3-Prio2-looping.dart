//1. tampilkan faktorial dari nilai nilai dibawah in:
    // 1. 10
    // 2. 40
    // 3. 50
    
void main() {
  int nilai1 = 10;
  int nilai2 = 40;
  int nilai3 = 50;

  tampilkanFaktor(nilai1);
  tampilkanFaktor(nilai2);
  tampilkanFaktor(nilai3);
}

void tampilkanFaktor(int n) {
  print('Faktor dari $n:');
  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      print(i);
    }
  }
}
