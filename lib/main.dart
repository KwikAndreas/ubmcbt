import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ubmcbt/pages/splash_screen.dart';
import 'package:ubmcbt/pages/login.dart';
import 'package:ubmcbt/pages/dashboard_mahasiswa.dart';
import 'package:ubmcbt/pages/dashboard_admin.dart';
import 'package:ubmcbt/pages/detail_ujian.dart';
import 'package:ubmcbt/pages/halaman_ujian.dart';
import 'package:ubmcbt/pages/tambah_soal.dart';
import 'package:ubmcbt/pages/informasi.dart';
import 'package:ubmcbt/pages/profil_mahasiswa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CBTApp());
}

class CBTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Exam App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => HalamanLogin(),
        '/dashboardMahasiswa': (context) => DashboardMahasiswa(),
        '/detailUjian': (context) => DetailUjian(),
        '/halamanUjian': (context) => HalamanUjian(),
        '/dashboardAdmin': (context) => DashboardAdmin(),
        '/tambahSoal': (context) => TambahSoal(),
        '/informasi': (context) => HalamanInformasi(),
        '/profilMahasiswa': (context) => HalamanProfil(),
      },
    );
  }
}
