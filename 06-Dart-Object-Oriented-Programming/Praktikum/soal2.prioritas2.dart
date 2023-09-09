class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

class Student {
  String nama;
  String kelas;
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  // Menambahkan course ke daftar course student
  void tambahCourse(String judul, String deskripsi) {
    Course course = Course(judul, deskripsi);
    daftarCourse.add(course);
  }

  // Menghapus course dari daftar course student
  void hapusCourse(String judul) {
    daftarCourse.removeWhere((course) => course.judul == judul);
  }

  // Melihat semua course yang dimiliki student
  void lihatDaftarCourse() {
    print('Daftar Course untuk $nama (Kelas: $kelas):');
    if (daftarCourse.isEmpty) {
      print('Belum ada course yang ditambahkan.');
    } else {
      for (var course in daftarCourse) {
        print('${course.judul}: ${course.deskripsi}');
      }
    }
  }
}

void main() {
  Student student1 = Student('Putri', '12 MIPA 1');
  student1.tambahCourse('Web', 'Materi website dasar.');
  student1.tambahCourse('Basis Data', 'Materi basis data.');

  Student student2 = Student('Dimas', '12 MIPA 1');
  student2.tambahCourse('Bahasa Inggris', 'Materi bahasa Inggris dasar.');
  student2.tambahCourse('Matematika', 'Materi Fungsi bangun ruang.');

  student1.lihatDaftarCourse();
  student2.lihatDaftarCourse();

  student1.hapusCourse('Basis Data');
  student2.hapusCourse('Bahasa Inggris');

  student1.lihatDaftarCourse();
  student2.lihatDaftarCourse();
}
