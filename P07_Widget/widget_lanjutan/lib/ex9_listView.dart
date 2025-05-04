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
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> createItems(int count) {
    List<Widget> items = <Widget>[];
    for (var i = 0; i < count; i++) {
      items.add(
        ListTile(
          title: Text('Item ${i + 1}'),
          leading: const Icon(Icons.star),
          trailing: const Icon(Icons.delete),
        ),
      );
      items.add(const Divider(color: Colors.black26));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan Menggunakan Widget'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: createItems(20),
      ),
    );
  }
}
