//Buatlah sebuah piramid bintang

void main() {
  int susun = 8;

  for (int i = 1; i <= susun; i++) {
    String space = ' ' * (susun - i);
    String stars = '*' * (2 * i - 1);
    print('$space$stars');
  }
}
