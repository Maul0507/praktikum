import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextAlign App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
        backgroundColor: Colors.blue,
        title: const Text('Metode Text.textAlign'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10.0),
            child: const Text(
              'Nilai TextAlign.start pada teks dengan TextDirection.ltr',
              style: TextStyle(fontSize: 16.0),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10.0),
            child: const Text(
              'Nilai TextAlign.end pada teks dengan TextDirection.ltr',
              style: TextStyle(fontSize: 16.0),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.end,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10.0),
            child: const Text(
              'Nilai TextAlign.start pada teks dengan TextDirection.rtl',
              style: TextStyle(fontSize: 16.0),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10.0),
            child: const Text(
              'Nilai TextAlign.end pada teks dengan TextDirection.rtl',
              style: TextStyle(fontSize: 16.0),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}