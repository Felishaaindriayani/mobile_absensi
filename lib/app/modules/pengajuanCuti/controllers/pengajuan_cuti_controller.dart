import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_absensi/app/data/pengajuanCuti_response.dart';
import 'dart:convert';


class PengajuanCutiController extends GetxController {
  var isLoading = true.obs;
  var listPengajuanCuti = <Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPengajuanCuti();
  }

  Future<void> fetchPengajuanCuti() async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse(
            'http://192.168.43.187:8000/api/pengajuancuti'), // Ganti dengan endpoint kamu
        headers: {
          'Authorization': 'Bearer TaO0gfGAxFAHCfColI5DICuHij3ua1R1wdPlOeat4ede5fab', // Ganti dengan tokenmu
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final result =
            pengajuanCuti_response.fromJson(json.decode(response.body));
        listPengajuanCuti.value = result.data ?? [];
      } else {
        Get.snackbar('Error', 'Gagal memuat data pengajuan cuti');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
