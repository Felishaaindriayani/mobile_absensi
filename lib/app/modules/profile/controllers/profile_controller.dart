import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_absensi/app/data/profile_response.dart';


class ProfileController extends GetxController {
  var isLoading = true.obs;
  var profile = Data().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void fetchProfile() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse('http://192.168.43.187:8000/api/profile'),
        headers: {
          'Authorization': 'Bearer fFO66K6TLxmeA66bfnTc8sPrssl9sBqp2YpqD09Lcf2c08ea', // Ganti token kamu di sini
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var result = profile_response.fromJson(json.decode(response.body));
        if (result.data != null) {
          profile.value = result.data!;
        }
      } else {
        Get.snackbar("Error", "Gagal mengambil data profil");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
