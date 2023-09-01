import 'data.dart';

void main() {
  removeElektronik();
  print(stockData);
}

void removeElektronik() {
  stockData.removeWhere((entry) => entry["title"] == "Elektronik");
}