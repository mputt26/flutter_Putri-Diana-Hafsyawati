//Buatlah sebuah jam pasir
void main() {
  int tingkat = 6;

  for (int i = 1; i <= tingkat; i++) {
    String space = ' ' * (i - 1);
    String stars = '*' * (2 * (tingkat - i) + 1);
    print('$space$stars');
  }

  for (int i = tingkat - 1; i >= 1; i--) {
    String space = ' ' * (i - 1);
    String stars = '*' * (2 * (tingkat - i) + 1);
    print('$space$stars');
  }
}
