import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HalamanLogin extends StatefulWidget {
  @override
  _HalamanLoginState createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final TextEditingController _idMahasiswaController = TextEditingController();
  final TextEditingController _kataSandiController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void masuk() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _idMahasiswaController.text,
        password: _kataSandiController.text,
      );

      if (userCredential.user != null) {
        // Check if user is admin or student
        if (userCredential.user!.email!.contains('admin')) {
          Navigator.pushReplacementNamed(context, '/dashboardAdmin');
        } else {
          Navigator.pushReplacementNamed(context, '/dashboardMahasiswa');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo_ubm.png'),
              TextField(
                controller: _idMahasiswaController,
                decoration: InputDecoration(labelText: 'ID Mahasiswa'),
              ),
              TextField(
                controller: _kataSandiController,
                decoration: InputDecoration(labelText: 'Kata Sandi'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: masuk,
                child: Text('Masuk'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
