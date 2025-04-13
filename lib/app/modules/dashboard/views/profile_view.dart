import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_absensi/app/modules/profile/controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // PASTIKAN ini ada biar controller ter-*register*
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        var p = controller.profile.value;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Icon(Icons.account_circle,
                        size: 80, color: Colors.blueGrey),
                  ),
                  const SizedBox(height: 16),
                  Text("Nama: ${p.name ?? '-'}",
                      style: TextStyle(fontSize: 18)),
                  Text("Email: ${p.email ?? '-'}",
                      style: TextStyle(fontSize: 16)),
                  Text("NIP: ${p.nip ?? '-'}", style: TextStyle(fontSize: 16)),
                  Text("Telepon: ${p.telepon ?? '-'}",
                      style: TextStyle(fontSize: 16)),
                  Text("Jenis Kelamin: ${p.jenisKelamin ?? '-'}",
                      style: TextStyle(fontSize: 16)),
                  Text(
                      "Tempat, Tgl Lahir: ${p.tempatLahir ?? '-'}, ${p.tglLahir ?? '-'}",
                      style: TextStyle(fontSize: 16)),
                  Text("Alamat: ${p.alamat ?? '-'}",
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
