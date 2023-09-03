void main() {
  List<String> input = [
    'js',
    'js',
    'js',
    'golang',
    'python',
    'js',
    'js',
    'golang',
    'rust'
  ];

  Map<String, int> frekuensi = countFrequency(input);

  frekuensi.forEach((key, value) {
    print('$key: $value');
  });
}

Map<String, int> countFrequency(List<String> input) {
  Map<String, int> frekuensi = {};

  for (String item in input) {
    if (frekuensi.containsKey(item)) {
      frekuensi[item]= frekuensi[item]! + 1;
    } else {
      frekuensi[item] = 1;
    }
  }

  return frekuensi;
}
