import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProfilSyahril(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProfilSyahril extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Syahril Maulana'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('images/profil.jpg'), 
            ),
            SizedBox(height: 20),
            Text(
              'Syahril Maulana',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            biodataTile('Tempat, Tanggal Lahir', 'Tameran, 05 Juli 2005'),
            biodataTile('Email', 'syhrlmlna00@gmail.com'),
            biodataTile('No HP', '081329066876'),
            biodataTile('Hobby', 'Ngoding'),
          ],
        ),
      ),
    );
  }

  Widget biodataTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
