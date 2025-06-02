import 'package:flutter/material.dart';
import '../models/kabupaten.dart';
import '../utils/launcher.dart';

class DetailPage extends StatelessWidget {
  final Kabupaten kabupaten;

  const DetailPage({super.key, required this.kabupaten});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(kabupaten.nama, style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  kabupaten.logoUrl,
                  height: 120,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.image, size: 100),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildDetailItem("Pusat Pemerintahan", kabupaten.pusatPemerintahan),
            _buildDetailItem("Bupati/Walikota", kabupaten.bupati),
            _buildDetailItem("Luas Wilayah", "${kabupaten.luas} km²"),
            _buildDetailItem("Jumlah Penduduk", "${kabupaten.penduduk}"),
            _buildDetailItem("Jumlah Kecamatan", "${kabupaten.kecamatan}"),
            _buildDetailItem("Jumlah Kelurahan", "${kabupaten.kelurahan}"),
            _buildDetailItem("Jumlah Desa", "${kabupaten.desa}"),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () => launchWebsite(kabupaten.website),
                child: const Text('Kunjungi Website Resmi',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
