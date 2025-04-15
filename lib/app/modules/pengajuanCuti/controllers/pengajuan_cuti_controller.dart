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
            'http:///192.168.0.184:8000/api/pengajuancuti'), // Ganti dengan endpoint kamu
        headers: {
          'Authorization':
              'Bearer vt0bhPKrdUalnP3i2Bnugt55ux9RKoRLStIjoLgPa5d7fa8b', // Ganti dengan tokenmu
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

  Future<void> submitPengajuanCuti({
    required String tanggalPengajuan,
    required String tanggalMulai,
    required String tanggalSelesai,
    required String alasan,
    required int kategoriCutiId,
  }) async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse('http://192.168.0.184:8000/api/pengajuancuti'),
        headers: {
          'Authorization':
              'Bearer vt0bhPKrdUalnP3i2Bnugt55ux9RKoRLStIjoLgPa5d7fa8b',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'tanggal_pengajuan': tanggalPengajuan,
          'tanggal_mulai': tanggalMulai,
          'tanggal_selesai': tanggalSelesai,
          'alasan': alasan,
          'kategori_cuti': kategoriCutiId.toString(), // ✅ dijadikan string
        }),
      );

      if (response.statusCode == 422) {
        final errorData = json.decode(response.body);
        print(errorData); // untuk debugging
        Get.snackbar('Validasi Gagal', errorData.toString());
        return;
      }

      if (response.statusCode == 201 || response.statusCode == 200) {
        Get.snackbar('Sukses', 'Pengajuan cuti berhasil!');
        fetchPengajuanCuti(); // refresh list setelah post
      } else {
        print(response.body);
        Get.snackbar(
            'Gagal', 'Pengajuan gagal. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'Terjadi kesalahan saat mengirim pengajuan.');
    } finally {
      isLoading.value = false;
    }
  }
}
