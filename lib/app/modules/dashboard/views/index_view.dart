import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexView extends GetView {
  const IndexView({super.key});

  void handleAbsen(String jenis) {
    Get.snackbar("Absen", "Anda menekan tombol Absen $jenis");
    // TODO: Implementasi logic absen sesuai jenis
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Dashboard Absensi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAbsenButton(
              icon: Icons.login,
              label: 'Absen Masuk',
              color: Colors.green,
              onPressed: () => handleAbsen("Masuk"),
            ),
            const SizedBox(height: 20),
            _buildAbsenButton(
              icon: Icons.logout,
              label: 'Absen Pulang',
              color: Colors.blue,
              onPressed: () => handleAbsen("Pulang"),
            ),
            const SizedBox(height: 20),
            _buildAbsenButton(
              icon: Icons.sick,
              label: 'Absen Sakit',
              color: Colors.orange,
              onPressed: () => handleAbsen("Sakit"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAbsenButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 26),
        label: Text(label, style: const TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
