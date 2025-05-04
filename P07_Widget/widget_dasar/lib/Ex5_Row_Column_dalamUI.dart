import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  final String judul = 'Politeknik Negeri Bengkalis';
  final String lokasi = 'Bengkalis, Riau';
  final String deskripsi =
      "Politeknik Negeri Bengkalis (POLBENG) adalah satu-satunya politeknik negeri yang berada di Riau. Pada tanggal 29 Juli 2011, Politeknik Bengkalis resmi menjadi PTN dengan nama Politeknik Negeri Bengkalis melalui Peraturan Menteri Pendidikan Nasional (Permendiknas) No. 28 tahun 2011 tentang Pendirian, Organisasi dan Tata Kerja Politeknik Negeri Bengkalis. Hingga saat ini POLBENG sudah memiliki 8 jurusan yaitu teknik perkapalan, teknik mesin, teknik elektro, teknik sipil, administrasi niaga, teknik informatika, kemaritiman dan bahasa.";

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil POLBENG'),
        backgroundColor: Colors.blue[400],
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Image.asset(
                  'images/logo_polbeng.png',
                  height: 180.0,
                  width: 180.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 4.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    judul,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ), // Sedikit jarak antara judul dan bintang
                  const Icon(
                    Icons.star,
                    size: 14.0, // Ukuran bintang lebih kecil sesuai foto
                    color: Colors.red,
                  ),
                  Text('5', style: TextStyle(fontSize: 12.0)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: Text(
                lokasi,
                style: TextStyle(fontSize: 14.0, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                deskripsi,
                style: TextStyle(fontSize: 13.0, height: 1.3),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
