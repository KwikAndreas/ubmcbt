import 'package:flutter/material.dart';
import 'package:ubmcbt/models/ujian.dart';
import 'package:ubmcbt/services/database_service.dart';

class TambahSoal extends StatefulWidget {
  @override
  _TambahSoalState createState() => _TambahSoalState();
}

class _TambahSoalState extends State<TambahSoal> {
  List<SoalUjian> soalUjian = [];
  int jumlahSoal = 0;
  final Map<int, String> jawabanBenar = {};

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

  void tambahSoal() {
    setState(() {
      soalUjian.addAll(List.generate(jumlahSoal, (index) => SoalUjian(soal: '', jawaban: List.filled(4, ''), jawabanBenar: '')));
    });
  }

  void simpanSoal() {
    final MataKuliah mataKuliah = ModalRoute.of(context)!.settings.arguments as MataKuliah;
    DatabaseService().simpanSoal(mataKuliah.id, soalUjian);
    Navigator.pushNamed(context, '/dashboardAdmin');
  }

  @override
  Widget build(BuildContext context) {
    final MataKuliah mataKuliah = ModalRoute.of(context)!.settings.arguments as MataKuliah;

    return Scaffold(
      appBar: AppBar(title: Text('Tambah Soal - ${mataKuliah.nama}')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Jumlah Soal'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  jumlahSoal = int.parse(value);
                });
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: tambahSoal,
              child: Text('Tambah Soal'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: soalUjian.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(labelText: 'Soal'),
                            onChanged: (value) {
                              soalUjian[index].soal = value;
                            },
                          ),
                          for (var i = 0; i < 4; i++)
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(labelText: 'Jawaban ${String.fromCharCode(65 + i)}'),
                                    onChanged: (value) {
                                      soalUjian[index].jawaban[i] = value;
                                    },
                                  ),
                                ),
                                Checkbox(
                                  value: jawabanBenar[index] == soalUjian[index].jawaban[i],
                                  onChanged: (value) {
                                    setState(() {
                                      jawabanBenar[index] = soalUjian[index].jawaban[i];
                                      soalUjian[index].jawabanBenar = soalUjian[index].jawaban[i];
                                    });
                                  },
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: simpanSoal,
              child: Text('Simpan Soal'),
            ),
          ],
        ),
      ),
    );
  }
}
