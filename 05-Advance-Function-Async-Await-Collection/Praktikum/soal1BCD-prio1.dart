//Melakukan perulangan pada list daya secara asynch

import 'soal1A-prio1.dart';

Future<int> multipleaAsync(int value, int pengali) async {
  await Future.delayed(Duration(seconds: 1));
  return value * pengali;
}

void main() async {
  List<int> listData = [3, 5, 7, 9];
  int pengali = 4;

  List<int> result = await multiplyList(listData, pengali);
  print(listData);
  print(result);
}
