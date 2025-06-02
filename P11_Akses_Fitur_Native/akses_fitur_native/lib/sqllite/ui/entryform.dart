import 'package:flutter/material.dart';
import 'package:pepek/modul_11/sqllite/models/contact.dart';

class EntryForm extends StatefulWidget {
  final Contact contact;
  const EntryForm(this.contact, {Key? key}) : super(key: key);

  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  Contact? _contact;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _contact = widget.contact;

    // Isi form kalau sedang edit
    if (_contact!.name != "") {
      _nameController.text = _contact!.name;
      _phoneController.text = _contact!.phone;
    }

    return Scaffold(
      appBar: AppBar(
        title: _contact!.name == ""
            ? const Text("Tambah Data")
            : const Text("Ubah Data"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            // Nama
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),

            // No Handphone
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'No Handphone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),

            // Tombol Simpan dan Batal
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  // Tombol Simpan
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 90, 116, 235),
                      ),
                      child: const Text('Simpan'),
                      onPressed: () {
                        if (_contact == null || _contact!.name == "") {
                          _contact = Contact(
                            _nameController.text,
                            _phoneController.text,
                          );
                        } else {
                          _contact!.name = _nameController.text;
                          _contact!.phone = _phoneController.text;
                        }

                        Navigator.pop(context, _contact);
                      },
                    ),
                  ),

                  const SizedBox(width: 5.0),

                  // Tombol Batal
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 67, 130, 224),
                      ),
                      child: const Text('Batal'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
