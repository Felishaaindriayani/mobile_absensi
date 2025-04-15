import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_absensi/app/modules/pengajuanCuti/controllers/pengajuan_cuti_controller.dart';

class PengajuanCutiView extends GetView<PengajuanCutiController> {
  const PengajuanCutiView({super.key});

  @override
  Widget build(BuildContext context) {
    final PengajuanCutiController controller =
        Get.put(PengajuanCutiController());
    final TextEditingController tanggalPengajuanController =
        TextEditingController();
    final TextEditingController tanggalMulaiController =
        TextEditingController();
    final TextEditingController tanggalSelesaiController =
        TextEditingController();
    final TextEditingController alasanController = TextEditingController();
    RxInt selectedKategoriCutiId = 1.obs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan Cuti'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.listPengajuanCuti.isEmpty) {
          return const Center(child: Text("Belum ada pengajuan cuti"));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.listPengajuanCuti.length,
          itemBuilder: (context, index) {
            final item = controller.listPengajuanCuti[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text("Cuti: ${item.kategoriCuti ?? '-'}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pengajuan: ${item.tanggalPengajuan ?? '-'}"),
                    Text("Mulai: ${item.tanggalMulai ?? '-'}"),
                    Text("Selesai: ${item.tanggalSelesai ?? '-'}"),
                    Text("Status: ${item.status ?? '-'}"),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // <--- Tambahan
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue, // <--- Biar makin kelihatan
        onPressed: () {
          Get.bottomSheet(
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Ajukan Cuti",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: tanggalPengajuanController,
                      decoration: const InputDecoration(
                          labelText: 'Tanggal Pengajuan (YYYY-MM-DD)'),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: tanggalMulaiController,
                      decoration: const InputDecoration(
                          labelText: 'Tanggal Mulai (YYYY-MM-DD)'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: tanggalSelesaiController,
                      decoration: const InputDecoration(
                          labelText: 'Tanggal Selesai (YYYY-MM-DD)'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: alasanController,
                      decoration: const InputDecoration(labelText: 'Alasan'),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<int>(
                      value: selectedKategoriCutiId.value,
                      onChanged: (value) {
                        if (value != null) selectedKategoriCutiId.value = value;
                      },
                      decoration:
                          const InputDecoration(labelText: 'Kategori Cuti'),
                      items: const [
                        DropdownMenuItem(value: 1, child: Text("Cuti Tahunan")),
                        DropdownMenuItem(
                            value: 2, child: Text("Cuti Melahirkan")),
                        DropdownMenuItem(value: 3, child: Text("Cuti Sakit")),
                        DropdownMenuItem(value: 4, child: Text("Izin")),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Obx(() => ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () {
                                  if (tanggalMulaiController.text.isEmpty ||
                                      tanggalSelesaiController.text.isEmpty ||
                                      alasanController.text.isEmpty) {
                                    Get.snackbar("Peringatan",
                                        "Semua field harus diisi!");
                                    return;
                                  }

                                  controller.submitPengajuanCuti(
                                    tanggalPengajuan:
                                        tanggalPengajuanController.text,
                                    tanggalMulai: tanggalMulaiController.text,
                                    tanggalSelesai:
                                        tanggalSelesaiController.text,
                                    alasan: alasanController.text,
                                    kategoriCutiId:
                                        selectedKategoriCutiId.value,
                                  );
                                  Get.back(); // Tutup bottom sheet
                                },
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : const Text("Kirim Pengajuan"),
                        )),
                  ],
                ),
              ),
            ),
            isScrollControlled: true,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
