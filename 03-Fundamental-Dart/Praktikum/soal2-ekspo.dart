void main() {
  int bilangan = 24;

  print('Mencari faktor dari $bilangan:');
  for (int i = 1; i < bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }
}
