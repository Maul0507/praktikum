import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/kabupaten.dart';

class AddKabupatenPage extends StatefulWidget {
  const AddKabupatenPage({super.key});

  @override
  State<AddKabupatenPage> createState() => _AddKabupatenPageState();
}

class _AddKabupatenPageState extends State<AddKabupatenPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController pusatController = TextEditingController();
  final TextEditingController bupatiController = TextEditingController();
  final TextEditingController luasController = TextEditingController();
  final TextEditingController pendudukController = TextEditingController();
  final TextEditingController kecamatanController = TextEditingController();
  final TextEditingController kelurahanController = TextEditingController();
  final TextEditingController desaController = TextEditingController();
  final TextEditingController logoUrlController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    pusatController.dispose();
    bupatiController.dispose();
    luasController.dispose();
    pendudukController.dispose();
    kecamatanController.dispose();
    kelurahanController.dispose();
    desaController.dispose();
    logoUrlController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  Future<void> simpanData() async {
    if (_formKey.currentState!.validate()) {
      final kab = Kabupaten(
        nama: namaController.text,
        pusatPemerintahan: pusatController.text,
        bupati: bupatiController.text,
        luas: double.tryParse(luasController.text) ?? 0,
        penduduk: int.tryParse(pendudukController.text) ?? 0,
        kecamatan: int.tryParse(kecamatanController.text) ?? 0,
        kelurahan: int.tryParse(kelurahanController.text) ?? 0,
        desa: int.tryParse(desaController.text) ?? 0,
        logoUrl: logoUrlController.text,
        website: websiteController.text,
      );

      await DatabaseHelper().insertKabupaten(kab);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Tambah Kabupaten', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(namaController, 'Nama Kabupaten'),
              _buildTextField(pusatController, 'Pusat Pemerintahan'),
              _buildTextField(bupatiController, 'Bupati'),
              _buildTextField(luasController, 'Luas Wilayah (km²)', TextInputType.number),
              _buildTextField(pendudukController, 'Jumlah Penduduk', TextInputType.number),
              _buildTextField(kecamatanController, 'Jumlah Kecamatan', TextInputType.number),
              _buildTextField(kelurahanController, 'Jumlah Kelurahan', TextInputType.number),
              _buildTextField(desaController, 'Jumlah Desa', TextInputType.number),
              _buildTextField(logoUrlController, 'URL Logo'),
              _buildTextField(websiteController, 'Website Resmi'),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: simpanData,
                child: const Text('Simpan', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, [TextInputType keyboardType = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        validator: (val) => val!.isEmpty ? 'Harus diisi' : null,
      ),
    );
  }
}
