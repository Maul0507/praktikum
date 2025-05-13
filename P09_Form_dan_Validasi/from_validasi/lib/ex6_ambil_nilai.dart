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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late FocusNode myFocusNode;

  final prodiController = TextEditingController();
  final nimController = TextEditingController();
  final namaController = TextEditingController();
  final semesterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    prodiController.addListener(printValue);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    prodiController.dispose();
    nimController.dispose();
    namaController.dispose();
    semesterController.dispose();
    super.dispose();
  }

  void printValue() {
    print('Teks pada field Program Studi: ${prodiController.text}');
  }

  void showData() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Nim : ${nimController.text}\n'
            'Nama : ${namaController.text}\n'
            'Prodi : ${prodiController.text}\n'
            'Semester: ${semesterController.text}',
          ),
        );
      },
    );
  }

  void validateInput() {
    final FormState? form = formKey.currentState;
    const snackBar = SnackBar(content: Text('Semua data sudah tervalidasi'));

    if (form!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      showData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nimController,
                decoration: const InputDecoration(
                  hintText: 'Nim',
                  labelText: 'Nim',
                  icon: Icon(Icons.person_pin),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator:
                    (value) => value!.isEmpty ? 'Nim tidak boleh kosong' : null,
                autofocus: true,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  hintText: 'Nama',
                  labelText: 'Nama',
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator:
                    (value) =>
                        value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                focusNode: myFocusNode,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: prodiController,
                decoration: const InputDecoration(
                  hintText: 'Program Studi',
                  labelText: 'Program Studi',
                  icon: Icon(Icons.dashboard),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator:
                    (value) =>
                        value!.isEmpty ? 'Prodi tidak boleh kosong' : null,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: semesterController,
                decoration: const InputDecoration(
                  hintText: 'Semester',
                  labelText: 'Semester',
                  icon: Icon(Icons.format_list_numbered),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        value!.isEmpty ? 'Semester tidak boleh kosong' : null,
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: validateInput,
                    child: const Text('Submit'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(myFocusNode);
                    },
                    child: const Text('Fokus ke Nama'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
