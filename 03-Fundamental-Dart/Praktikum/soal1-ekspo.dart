bool kataPalindrom(String kata) {
 
  String reversedWord = kata.split('').reversed.join(''); 
  return kata == reversedWord;
}

void main() {
  String word1 = "kasur rusak";
  String word2 = "mobil balap";
 
  if (kataPalindrom(word1)) {
    print("$word1 adalah palindrom");
  } else {
    print("$word1 bukan palindrom");
  }

  if (kataPalindrom(word2)) {
    print("$word2 adalah palindrom");
  } else {
    print("$word2 bukan palindrom");
  }

}