import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  void panggilSecondScreen(BuildContext context) async {
    final _result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const SecondScreen();
        },
      ),
    );
    print('Datanya adalah: $_result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Buka Screen 2'),
          onPressed: () {
            panggilSecondScreen(context);
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Kembali ke Screen 1'),
          onPressed: () {
            Navigator.pop(context, "2020");
          },
        ),
      ),
    );
  }
}
