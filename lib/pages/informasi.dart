import 'package:flutter/material.dart';

class HalamanInformasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Contoh data informasi ujian dan nilai akhir
    final List<Map<String, String>> informasiUjian = [
      {'mataKuliah': 'Matematika', 'jadwal': '10 Juni 2024', 'nilaiAkhir': '90'},
      {'mataKuliah': 'Fisika', 'jadwal': '12 Juni 2024', 'nilaiAkhir': '85'},
      // Tambah informasi lainnya di sini
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Informasi')),
      body: ListView.builder(
        itemCount: informasiUjian.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(informasiUjian[index]['mataKuliah']!),
              subtitle: Text('Jadwal: ${informasiUjian[index]['jadwal']} - Nilai Akhir: ${informasiUjian[index]['nilaiAkhir']}'),
            ),
          );
        },
      ),
    );
  }
}
