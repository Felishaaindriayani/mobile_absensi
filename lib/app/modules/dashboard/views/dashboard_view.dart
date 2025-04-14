import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<DashboardController>();
    final controller = Get.put(DashboardController());

    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.changeIndex(index);
          },
          selectedItemColor: Colors.blue, // Warna ikon aktif
          unselectedItemColor: Colors.grey, // Warna ikon tidak aktif
          backgroundColor: Colors.white, // Warna background navbar
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'Absensi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range),
              label: 'Pengajuan Cuti',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
