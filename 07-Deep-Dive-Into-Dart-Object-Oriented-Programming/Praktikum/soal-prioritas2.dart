class KelipatanPersekutuanTerkecil {
  int x;
  int y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  int hasil() {
    return x * y;
  }
}

class FaktorPersekutuanTerbesar {
  int x;
  int y;

  FaktorPersekutuanTerbesar(this.x, this.y);

  int hasil() {
    int a = x;
    int b = y;
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }
}

class Matematika implements KelipatanPersekutuanTerkecil, FaktorPersekutuanTerbesar {
  int x;
  int y;

  Matematika(this.x, this.y);

  int hasil() {
    return x * y;
  }
}

void main() {
  Matematika operation = Matematika(20, 32);

  print("Kelipatan Persekutuan Terkecil: ${operation.hasil()}");
  
  FaktorPersekutuanTerbesar operation2 = FaktorPersekutuanTerbesar(20, 32);
  print("Faktor Persekutuan Terbesar: ${operation2.hasil()}");
}
