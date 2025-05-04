import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkbox Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _checkboxVal1 = false;
  bool _checkboxVal2 = false;
  bool _checkboxVal3 = false;
  bool _checkboxVal4 = false;
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan Menggunakan Widget'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Bahasa pemrograman yang dikuasai:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            CheckboxListTile(
              title: const Text('Python'),
              value: _checkboxVal1,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxVal1 = value!;
                  if (_checkboxVal1) {
                    list.add('Python');
                  } else {
                    list.remove('Python');
                  }
                  print(list);
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            CheckboxListTile(
              title: const Text('Javascript'),
              value: _checkboxVal2,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxVal2 = value!;
                  if (_checkboxVal2) {
                    list.add('Javascript');
                  } else {
                    list.remove('Javascript');
                  }
                  print(list);
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            CheckboxListTile(
              title: const Text('PHP'),
              value: _checkboxVal3,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxVal3 = value!;
                  if (_checkboxVal3) {
                    list.add('PHP');
                  } else {
                    list.remove('PHP');
                  }
                  print(list);
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            CheckboxListTile(
              title: const Text('Java'),
              value: _checkboxVal4,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxVal4 = value!;
                  if (_checkboxVal4) {
                    list.add('Java');
                  } else {
                    list.remove('Java');
                  }
                  print(list);
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Data: ${list.join(", ")}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
