import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Percobaan Menggunakan Widget',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan Menggunakan Widget'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: Container(color: Colors.red)),
            Expanded(child: Container(color: Colors.orange)),
            Expanded(child: Container(color: Colors.yellow)),
            Expanded(child: Container(color: Colors.green)),
            Expanded(child: Container(color: Colors.blue)),
            Expanded(child: Container(color: Colors.indigo)),
            Expanded(child: Container(color: Colors.purple)),
          ],
        ),
      ),
    );
  }
}
