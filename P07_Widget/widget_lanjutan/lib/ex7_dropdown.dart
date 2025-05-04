import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const Home(), debugShowCheckedModeBanner: false);
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final List<String> _list = [
    'Bengkalis',
    'Bantan',
    'Siak Kecil',
    'Rupat',
    'Rupat Utara',
    'Bukit Batu',
  ];
  String _item = 'Bengkalis';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan Menggunakan Widget'),
        backgroundColor: Colors.blue, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            const Text('Pilih Kecamatan: '),
            DropdownButton<String>(
              value: _item,
              items:
                  _list.map((String val) {
                    return DropdownMenuItem(
                      value: val,
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.location_city),
                          const SizedBox(width: 8),
                          Text(val),
                        ],
                      ),
                    );
                  }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _item = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
