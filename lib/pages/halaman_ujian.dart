import 'package:flutter/material.dart';
import 'package:ubmcbt/models/ujian.dart';
import 'package:ubmcbt/services/database_service.dart';

class HalamanUjian extends StatefulWidget {
  @override
  _HalamanUjianState createState() => _HalamanUjianState();
}

class _HalamanUjianState extends State<HalamanUjian> {
  List<SoalUjian> soalUjian = [];
  final Map<int, String> jawabanMahasiswa = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final MataKuliah mataKuliah = ModalRoute.of(context)!.settings.arguments as MataKuliah;
    DatabaseService().getSoalUjian(mataKuliah.id).then((soal) {
      setState(() {
        soalUjian = soal;
      });
    });
  }

  void selesaikanUjian() {
    int nilaiAkhir = 0;
    soalUjian.asMap().forEach((index, soal) {
      if (jawabanMahasiswa[index] == soal.jawabanBenar) {
        nilaiAkhir += 10; // Misal nilai per soal benar adalah 10
      }
    });

    // Simpan jawaban dan nilai ke Firebase
    // ... kode untuk menyimpan jawaban dan nilai

    Navigator.pushNamed(context, '/dashboardMahasiswa');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ujian')),
      body: ListView.builder(
        itemCount: soalUjian.length,
        itemBuilder: (context, index) {
          final soal = soalUjian[index];
          return Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(soal.soal),
                  for (var jawaban in soal.jawaban)
                    RadioListTile(
                      title: Text(jawaban),
                      value: jawaban,
                      groupValue: jawabanMahasiswa[index],
                      onChanged: (value) {
                        setState(() {
                          jawabanMahasiswa[index] = value as String;
                        });
                      },
                    ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: selesaikanUjian,
          child: Text('Selesaikan Ujian'),
        ),
      ),
    );
  }
}
