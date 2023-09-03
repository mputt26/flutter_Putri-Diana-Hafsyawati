// Menerima 2 parameter, yaitu list data dan pengali

List<int> multiplyList(List<int> data, int pengali){
  List<int> hasil = [];

  for (int a = 0; a < data.length; a++) {
    int hasilPerkalian = data[a] * pengali;
    hasil.add(hasilPerkalian);
  }

  return hasil;
}

void main() {
  List<int> data = [5,10,15,20];
  int pengali = 3;

  List<int> hasilPerkalian = multiplyList(data, pengali);
  
  print(data);

  print("Hasil perkalian: $hasilPerkalian");
}