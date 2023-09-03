void main(){
  List<List<dynamic>> dataList =[
    ['Peralatan1', 'Laptop'],
    ['Peralatan2', 'Komputer'],
    ['Peralatan3', 'Mouse'],
  ];

  Map<String, String> resultMap = Map.fromIterable(dataList, key: (item) => item[0], value: (item) => item[1]);

  print(resultMap);
}