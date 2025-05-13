import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coba Widget - Snackbar')),
      body: Center(
        child: Builder(
          builder: (BuildContext context1) {
            return ElevatedButton(
              child: const Text('Tampilkan Snackbar'),
              onPressed: () {
                const snackBar = SnackBar(
                  content: Text('Pesan ditampilkan dengan cara pertama'),
                );
                ScaffoldMessenger.of(context1).showSnackBar(snackBar);
              },
            );
          },
        ),
      ),
    );
  }
}
