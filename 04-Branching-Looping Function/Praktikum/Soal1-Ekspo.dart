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
  int bilangan = 17;

  if (isPrime(bilangan)) {
    print('Angka $bilangan merupakan Bilangan prima');
  } else {
    print('Angka $bilangan merupakan Bukan bilangan prima');
  }
}
