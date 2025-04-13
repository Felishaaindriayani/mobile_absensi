import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_absensi/app/modules/pengajuanCuti/controllers/pengajuan_cuti_controller.dart';

class PengajuanCutiView extends GetView<PengajuanCutiController> {
  const PengajuanCutiView({super.key});

  @override
  Widget build(BuildContext context) {
    final PengajuanCutiController controller = Get.put(PengajuanCutiController());
    
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
          return const Center(child: Text("Tidak ada data cuti."));
        }

        return ListView.builder(
          itemCount: controller.listPengajuanCuti.length,
          itemBuilder: (context, index) {
            final item = controller.listPengajuanCuti[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text("${item.kategoriCuti} - ${item.status}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Alasan: ${item.alasan}"),
                    Text(
                        "Tanggal: ${item.tanggalMulai} s.d ${item.tanggalSelesai}"),
                    Text("Pegawai: ${item.pegawai?.name ?? '-'}"),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
