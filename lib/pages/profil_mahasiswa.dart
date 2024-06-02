import 'package:flutter/material.dart';

class HalamanProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Contoh data profil mahasiswa
    final Map<String, String> profilMahasiswa = {
      'fotoProfil': 'assets/profile.png',
      'nama': 'John Doe',
      'idMahasiswa': '12345678',
      'email': 'john.doe@student.ubm.ac.id',
      'kelas': 'TI 2020'
    };

    return Scaffold(
      appBar: AppBar(title: Text('Profil Mahasiswa')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profilMahasiswa['fotoProfil']!),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text('Nama: ${profilMahasiswa['nama']}'),
            Text('ID Mahasiswa: ${profilMahasiswa['idMahasiswa']}'),
            Text('Email: ${profilMahasiswa['email']}'),
            Text('Kelas: ${profilMahasiswa['kelas']}'),
          ],
        ),
      ),
    );
  }
}
