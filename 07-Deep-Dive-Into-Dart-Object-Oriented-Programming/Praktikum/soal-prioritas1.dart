class BangunRuang {
  int panjang;
  int lebar;
  int tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  int hitungVolume() {
    return panjang * lebar * tinggi;
  }

  int volume() {
    return hitungVolume();
  }
}

class Kubus extends BangunRuang {
  int sisi;

  Kubus(this.sisi) : super(sisi, sisi, sisi);

  @override
  int hitungVolume() {
    return sisi * sisi * sisi;
  }

  @override
  int volume() {
    return hitungVolume();
  }
}

class Balok extends BangunRuang {
  Balok(int panjang, int lebar, int tinggi) : super(panjang, lebar, tinggi);

  @override
  int volume() {
    return hitungVolume();
  }
}

void main() {
  Kubus kubus = Kubus(7);
  Balok balok = Balok(5, 3, 8);
  BangunRuang bangunruang = BangunRuang(10, 5, 16);

  print('Volume Kubus: ${kubus.volume()}');
  print('Volume Balok: ${balok.volume()}');
  print('Volume Bangun Ruang adalah: ${bangunruang.volume()}');
}
