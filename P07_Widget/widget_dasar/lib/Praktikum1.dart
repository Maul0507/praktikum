import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Data Mahasiswa'),
        backgroundColor: Colors.blue, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(flex: 1, child: Text("No", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 3, child: Text("NIM", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(flex: 5, child: Text("NAMA", style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            Divider(),
            Row(
              children: const [
                Expanded(flex: 1, child: Text("1")),
                Expanded(flex: 3, child: Text("1106315")),
                Expanded(flex: 5, child: Text("Depandi Enda")),
              ],
            ),
            Divider(),
            Row(
              children: const [
                Expanded(flex: 1, child: Text("2")),
                Expanded(flex: 3, child: Text("1106316")),
                Expanded(flex: 5, child: Text("Budi Handoyo")),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    ),
  ));
}
