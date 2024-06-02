class MataKuliah {
  final String id;
  final String nama;
  final String deskripsi;
  final int jumlahSoal;

  MataKuliah({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.jumlahSoal,
  });
}

class SoalUjian {
  String soal;
  List<String> jawaban;
  String jawabanBenar;

  SoalUjian({
    required this.soal,
    required this.jawaban,
    required this.jawabanBenar,
  });
}
