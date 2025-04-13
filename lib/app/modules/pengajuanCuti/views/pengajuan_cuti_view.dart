import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengajuan_cuti_controller.dart';

class PengajuanCutiView extends GetView<PengajuanCutiController> {
  const PengajuanCutiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PengajuanCutiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PengajuanCutiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
