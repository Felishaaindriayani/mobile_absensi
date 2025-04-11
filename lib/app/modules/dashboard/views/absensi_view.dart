import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_absensi/app/modules/absensi/controllers/absensi_controller.dart';


class AbsensiView extends StatelessWidget {
  AbsensiView({super.key});
  final AbsensiController controller = Get.put(AbsensiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Absensi'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.absensiList.isEmpty) {
          return const Center(child: Text("Tidak ada data absensi."));
        }

        return ListView.builder(
          itemCount: controller.absensiList.length,
          itemBuilder: (context, index) {
            final item = controller.absensiList[index];
            return ListTile(
              title: Text(item.pegawai?.name ?? 'Nama tidak tersedia'),
              subtitle: Text("Tanggal: ${item.tanggal ?? '-'}"),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Masuk: ${item.jamMasuk ?? '-'}"),
                  Text("Keluar: ${item.jamKeluar ?? '-'}"),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
