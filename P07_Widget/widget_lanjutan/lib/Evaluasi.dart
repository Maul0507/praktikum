import 'package:flutter/material.dart';

void main() {
  runApp(const EvaluasiApp());
}

class EvaluasiApp extends StatelessWidget {
  const EvaluasiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evaluasi Josefin Sans',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue, 
          title: const Text(
            'Percobaan Menggunakan Widget',
            style: TextStyle(fontFamily: 'JosefinSans'),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Visi',
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Prodi D4 Rekayasa Perangkat Lunak yang telah ditetapkan oleh Direktur '
                  'Politeknik Negeri Bengkalis melalui surat keputusan No. 2061/PL31/TU/2016 adalah '
                  '"Menjadi Program Studi vokasi yang menghasilkan lulusan bidang rekayasa perangkat lunak '
                  'berstandar Nasional dan menuju reputasi Internasional pada tahun 2020".',
                  style: TextStyle(fontFamily: 'JosefinSans', fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Misi',
                  style: TextStyle(
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '1. Menyelenggarakan pendidikan dan meningkatkan kemampuan mahasiswa dalam '
                  'menerapkan Ilmu Pengetahuan dan Teknologi Rekayasa Perangkat Lunak bidang Rekayasa '
                  'web dan Aplikasi mobile untuk meningkatkan daya saing yang tinggi.\n\n'
                  '2. Menciptakan, mengembangkan dan menerapkan ilmu pengetahuan dan teknologi untuk '
                  'menghasilkan produk unggulan rekayasa perangkat lunak.\n\n'
                  '3. Meningkatkan pemanfaatan teknologi informasi dalam mengatasi permasalahan di lingkungan '
                  'internal maupun eksternal (industri, pemerintah dan masyarakat umum).\n\n'
                  '4. Melaksanakan dan mengembangkan desain dan jejaring kerjasama bidang rekayasa perangkat lunak '
                  'yang berkelanjutan dengan institusi dalam dan luar negeri.',
                  style: TextStyle(fontFamily: 'JosefinSans', fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
