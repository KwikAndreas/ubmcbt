import 'package:flutter/material.dart';
import 'package:ubmcbt/services/database_service.dart';
import 'package:ubmcbt/models/ujian.dart';

class DashboardAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard Admin')),
      body: FutureBuilder<List<MataKuliah>>(
        future: DatabaseService().getMataKuliah(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final mataKuliah = snapshot.data!;

          return ListView.builder(
            itemCount: mataKuliah.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(mataKuliah[index].nama),
                  subtitle: Text(mataKuliah[index].deskripsi),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/tambahSoal',
                      arguments: mataKuliah[index],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
