import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_master_data_akun_laba_rugi_controller.dart';

class SettingsMasterDataAkunLabaRugiView
    extends GetView<SettingsMasterDataAkunLabaRugiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsMasterDataAkunLabaRugiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsMasterDataAkunLabaRugiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
