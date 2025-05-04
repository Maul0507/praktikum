import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Font',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(title: 'Percobaan Menggunakan Widget'),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan Menggunakan Widget'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 15.0),
            const Text(
              'PlayfairDisplay-Regular',
              style: TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 30),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'PlayfairDisplay-Italic',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontStyle: FontStyle.italic,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'PlayfairDisplay-Bold',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
