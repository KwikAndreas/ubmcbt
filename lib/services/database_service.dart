import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ubmcbt/models/ujian.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<MataKuliah>> getMataKuliah() async {
    QuerySnapshot snapshot = await _db.collection('mataKuliah').get();
    return snapshot.docs.map((doc) {
      return MataKuliah(
        id: doc.id,
        nama: doc['nama'],
        deskripsi: doc['deskripsi'],
        jumlahSoal: doc['jumlahSoal'],
      );
    }).toList();
  }

  Future<List<SoalUjian>> getSoalUjian(String mataKuliahId) async {
    QuerySnapshot snapshot = await _db.collection('mataKuliah').doc(mataKuliahId).collection('soalUjian').get();
    return snapshot.docs.map((doc) {
      return SoalUjian(
        soal: doc['soal'],
        jawaban: List<String>.from(doc['jawaban']),
        jawabanBenar: doc['jawabanBenar'],
      );
    }).toList();
  }

  Future<void> simpanSoal(String mataKuliahId, List<SoalUjian> soalUjian) async {
    final batch = _db.batch();

    for (var soal in soalUjian) {
      final doc = _db.collection('mataKuliah').doc(mataKuliahId).collection('soalUjian').doc();
      batch.set(doc, {
        'soal': soal.soal,
        'jawaban': soal.jawaban,
        'jawabanBenar': soal.jawabanBenar,
      });
    }

    await batch.commit();
  }

  Future<void> simpanJawaban(String mataKuliahId, String userId, List<String> jawaban, int nilaiAkhir) async {
    final doc = _db.collection('mataKuliah').doc(mataKuliahId).collection('jawabanMahasiswa').doc(userId);
    await doc.set({
      'jawaban': jawaban,
      'nilaiAkhir': nilaiAkhir,
    });
  }
}
