import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/kabupaten.dart';

class EditKabupatenPage extends StatefulWidget {
  final Kabupaten kabupaten;

  const EditKabupatenPage({super.key, required this.kabupaten});

  @override
  State<EditKabupatenPage> createState() => _EditKabupatenPageState();
}

class _EditKabupatenPageState extends State<EditKabupatenPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController namaController;
  late TextEditingController pusatController;
  late TextEditingController bupatiController;
  late TextEditingController luasController;
  late TextEditingController pendudukController;
  late TextEditingController kecamatanController;
  late TextEditingController kelurahanController;
  late TextEditingController desaController;
  late TextEditingController logoUrlController;
  late TextEditingController websiteController;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.kabupaten.nama);
    pusatController = TextEditingController(text: widget.kabupaten.pusatPemerintahan);
    bupatiController = TextEditingController(text: widget.kabupaten.bupati);
    luasController = TextEditingController(text: widget.kabupaten.luas.toString());
    pendudukController = TextEditingController(text: widget.kabupaten.penduduk.toString());
    kecamatanController = TextEditingController(text: widget.kabupaten.kecamatan.toString());
    kelurahanController = TextEditingController(text: widget.kabupaten.kelurahan.toString());
    desaController = TextEditingController(text: widget.kabupaten.desa.toString());
    logoUrlController = TextEditingController(text: widget.kabupaten.logoUrl);
    websiteController = TextEditingController(text: widget.kabupaten.website);
  }

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

  Future<void> updateData() async {
    if (_formKey.currentState!.validate()) {
      final updatedKabupaten = Kabupaten(
        id: widget.kabupaten.id,
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

      await DatabaseHelper().updateKabupaten(updatedKabupaten);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Edit Kabupaten', style: TextStyle(color: Colors.white)),
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
                onPressed: updateData,
                child: const Text('Simpan Perubahan', style: TextStyle(color: Colors.white)),
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
