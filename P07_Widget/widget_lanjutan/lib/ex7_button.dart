import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan Menggunakan Widget'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                },
                child: const Text(
                  'Elevated Button',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 5.0),
              OutlinedButton(
                onPressed: () {
                },
                child: const Text(
                  'Outline Button',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 5.0),
              TextButton(
                onPressed: () {
                },
                child: const Text(
                  'Text Button',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
