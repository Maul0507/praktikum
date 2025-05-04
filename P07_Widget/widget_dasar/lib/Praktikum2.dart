import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: HariDeskripsiApp(),
  ));
}
class HariDeskripsiApp extends StatefulWidget {
  @override
  _HariDeskripsiAppState createState() => _HariDeskripsiAppState();
}
class _HariDeskripsiAppState extends State<HariDeskripsiApp> {
  String _hariDipilih = '';
  String _deskripsi = '';
  final Map<String, String> _dataHari = {
    "Senin": "Hari yang luar biasa untuk memulai pekerjaanmu.",
    "Selasa": "Tetap semangat mengerjakan tugas.",
    "Rabu": "Selalu bahagia dan bersyukur dengan apa yang telah diperoleh.",
    "Kamis": "Kerja keras untuk menggapai cita-cita.",
    "Jumat": "Jangan lupa untuk beribadah.",
    "Sabtu": "Selamat weekend.",
    "Minggu": "Manfaatkan hari minggumu untuk istirahat.",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deskripsi Hari'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _dataHari.keys.map((hari) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hariDipilih = hari;
                      _deskripsi = _dataHari[hari]!;
                    });
                  },
                  child: Text(hari),
                );
              }).toList(),
            ),
            SizedBox(height: 24),
            if (_hariDipilih.isNotEmpty) ...[
              Text(
                'Hari: $_hariDipilih',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                _deskripsi,
                style: TextStyle(fontSize: 16),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
