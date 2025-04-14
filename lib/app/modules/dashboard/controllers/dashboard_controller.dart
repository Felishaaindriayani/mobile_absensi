import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_absensi/app/modules/dashboard/views/absensi_view.dart';
import 'package:mobile_absensi/app/modules/dashboard/views/index_view.dart';
import 'package:mobile_absensi/app/modules/dashboard/views/pengajuan_cuti_view.dart';
import 'package:mobile_absensi/app/modules/dashboard/views/profile_view.dart';




class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    IndexView(),
    AbsensiView(),
    PengajuanCutiView(),
    ProfileView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

