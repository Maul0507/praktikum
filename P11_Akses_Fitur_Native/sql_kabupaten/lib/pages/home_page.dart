import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/kabupaten.dart';
import 'detail_page.dart';
import 'add_kabupaten_page.dart';
import 'edit_kabupaten_page.dart'; // Import halaman edit

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Kabupaten> kabList = [];

  @override
  void initState() {
    super.initState();
    fetchKabupaten();
  }

  void fetchKabupaten() async {
    final data = await DatabaseHelper().getKabupatenList();
    setState(() => kabList = data);
  }

  Future<void> navigateToAddPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddKabupatenPage()),
    );

    if (result == true) {
      fetchKabupaten();
    }
  }

  Future<void> navigateToEditPage(Kabupaten kabupaten) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditKabupatenPage(kabupaten: kabupaten)),
    );

    if (result == true) {
      fetchKabupaten();
    }
  }

  void confirmDelete(Kabupaten kabupaten) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Kabupaten'),
        content: Text('Apakah Anda yakin ingin menghapus ${kabupaten.nama}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () async {
              await DatabaseHelper().deleteKabupaten(kabupaten.id!);
              fetchKabupaten();
              Navigator.pop(context);
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Kabupaten/Kota di Riau', style: TextStyle(color: Colors.white)),
      ),
      body: kabList.isEmpty
          ? const Center(child: Text('Belum ada data', style: TextStyle(fontSize: 18)))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: kabList.length,
              itemBuilder: (context, index) {
                final kab = kabList[index];
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        kab.logoUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image_not_supported, size: 50, color: Colors.grey);
                        },
                      ),
                    ),
                    title: Text(kab.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Bupati: ${kab.bupati}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blueAccent),
                          onPressed: () => navigateToEditPage(kab),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () => confirmDelete(kab),
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailPage(kabupaten: kab)),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: navigateToAddPage,
        tooltip: 'Tambah Kabupaten',
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
