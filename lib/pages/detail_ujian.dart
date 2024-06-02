import 'package:flutter/material.dart';
import 'package:ubmcbt/models/ujian.dart';

class DetailUjian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MataKuliah mataKuliah = ModalRoute.of(context)!.settings.arguments as MataKuliah;

    return Scaffold(
      appBar: AppBar(title: Text('Detail Ujian')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Mata Kuliah: ${mataKuliah.nama}'),
            Text('Deskripsi: ${mataKuliah.deskripsi}'),
            Text('Batas Waktu: 90 menit'),
            Text('Jumlah Soal: ${mataKuliah.jumlahSoal}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/halamanUjian', arguments: mataKuliah);
              },
              child: Text('Mulai Ujian'),
            ),
          ],
        ),
      ),
    );
  }
}
