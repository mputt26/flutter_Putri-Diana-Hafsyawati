// 1. Buatlah sebuah program untuk mengecek apakah sebuah bilangan termasuk bilangan prima atau bukan.
//Sampel Input: `23`
//Sampel Output:`bilangan prima`
//Sampel Input:`12`
//Sampel Output: `bukan bilangan prima`
bool isPrime(int angka) {
  if (angka <= 1) {
    return false;
  }
  for (int i = 2; i <= angka ~/ 2; i++) {
    if (angka % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  int bilangan = 23;
  int bilangan2 = 12;

  if (isPrime(bilangan)) {
    print('Angka $bilangan merupakan Bilangan prima');
  } else {
    print('Angka $bilangan merupakan Bukan bilangan prima');
  }

  if (isPrime(bilangan2)) {
    print('Angka $bilangan2 merupakan Bilangan prima');
  } else {
    print('Angka $bilangan2 merupakan Bukan bilangan prima');
  }
}
