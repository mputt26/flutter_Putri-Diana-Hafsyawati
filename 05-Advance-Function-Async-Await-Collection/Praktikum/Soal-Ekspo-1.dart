void main() {
  List<String> input1 = ['amuse', 'tommy kaira', 'spoon', 'HKS', 'litchfield', 'amuse', 'HKS'];
  List<String> input2 = ['JS Racing', 'amuse', 'spoon', 'spoon', 'JS Racing', 'amuse'];

  List<String> output1 = removeDuplicates(input1);
  List<String> output2 = removeDuplicates(input2);

  print(output1); // Output: [amuse, tommy kaira, spoon, HKS, litchfield]
  print(output2); // Output: [JS Racing, amuse, spoon]
}

List<String> removeDuplicates(List<String> input) {
  Set<String> uniqueItems = Set<String>();
  
  for (String item in input) {
    uniqueItems.add(item);
  }
  
  List<String> result = uniqueItems.toList();
  return result;
}