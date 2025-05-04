import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Action Button App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String fileName = 'images/logo_kemdikbud.jpg';

  void selectImage(int index) {
    setState(() {
      switch (index) {
        case 0:
          fileName = 'images/logo_kemdikbud.jpg';
          break;
        case 1:
          fileName = 'images/logo_polbeng.png';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Force blue color
        title: const Text('Demo Action Button'),
        actions: [
          IconButton(
            icon: const Icon(Icons.laptop),
            onPressed: () {
              selectImage(0);
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_balance),
            onPressed: () {
              selectImage(1);
            },
          ),
        ],
      ),
      body: Center(
        child: Image.asset(fileName, height: 350.0, fit: BoxFit.fill),
      ),
    );
  }
}
