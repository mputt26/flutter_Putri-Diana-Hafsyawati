void main() {
  //Deklarasi Persegi
  int sisi = 9;
  int luaspersegi = sisi * sisi;
  int kelilingpersegi = 4 * sisi;

  //Deklarasi persegi panjang
  int panjang = 10;
  int lebar = 5;

  int luaspersegipanjang = panjang * lebar;
  int kelilingpersegipanjang = 2 * (panjang + lebar);

  //persegi
  print('sisi dari persegi adalah $sisi');
  print('Luas persegi dari $sisi adalah $luaspersegi');
  print('Keliling persegi dari $sisi adalah $kelilingpersegi');

  //persegi panjang
  print('sisi panjang pada persegi panjang adalah $panjang');
  print('sisi lebar pada persegi panjang adalah $lebar');
  print(
      'Luas persegi panjang dari $panjang dan $lebar adalah $luaspersegipanjang');
  print(
      'Keliling persegi panjang dari $panjang dan $lebar adalah $kelilingpersegipanjang');
}
