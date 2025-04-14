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

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
              columns: const [
                DataColumn(label: Text('No')),
                DataColumn(label: Text('Nama')),
                DataColumn(label: Text('Tanggal')),
                DataColumn(label: Text('Jam Masuk')),
                DataColumn(label: Text('Jam Keluar')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Jam Kerja')),
              ],
              rows: List.generate(controller.absensiList.length, (index) {
                final item = controller.absensiList[index];
                final nama = item.pegawai?.name ?? '-';
                final tanggal = item.tanggal ?? '-';
                final masuk = item.jamMasuk ?? '-';
                final keluar = item.jamKeluar ?? '-';
                final status = item.status ?? '-';
                final jamKerja = item.jamKerja ?? '-';

                return DataRow(cells: [
                  DataCell(Text('${index + 1}')),
                  DataCell(Text(nama)),
                  DataCell(Text(tanggal)),
                  DataCell(Text(masuk)),
                  DataCell(Text(keluar)),
                  DataCell(Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(status),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      status,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
                  DataCell(Text(jamKerja)),
                ]);
              }),
            ),
          ),
        );
      }),
    );
  }

  // Fungsi helper warna status
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'hadir':
        return Colors.green;
      case 'terlambat':
        return Colors.orange;
      case 'sakit':
        return Colors.red;
      case 'izin':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
