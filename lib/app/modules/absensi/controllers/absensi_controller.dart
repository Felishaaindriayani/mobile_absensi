import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_absensi/app/data/absensi_response.dart';
import 'package:mobile_absensi/app/utils/api.dart';


class AbsensiController extends GetxController {
  var isLoading = true.obs;
  var absensiList = <Data>[].obs;

  @override
  void onInit() {
    fetchAbsensi();
    super.onInit();
  }

  void fetchAbsensi() async {
    try {
      isLoading(true);

      String token = "Bearer TaO0gfGAxFAHCfColI5DICuHij3ua1R1wdPlOeat4ede5fab";

      var response = await http.get(
        Uri.parse(BaseUrl.absensi),
        headers: {
          "Authorization": token,
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        var parsed = absensi_response.fromJson(jsonData);
        absensiList.value = parsed.data ?? [];
      } else {
        Get.snackbar("Error", "Gagal mengambil data absensi");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

}
