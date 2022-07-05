import 'package:flutter/material.dart';
import 'package:generalledger/app/models/konsep_akun_model.dart';
import 'package:generalledger/app/mahas/components/pages/list_page_component.dart';

import 'package:get/get.dart';

import '../controllers/settings_master_data_konsep_akun_controller.dart';

class SettingsMasterDataKonsepAkunView
    extends GetView<SettingsMasterDataKonsepAkunController> {
  @override
  Widget build(BuildContext context) => ListPageComponent<KonsepAkunModel>(
        controller: controller.listCon,
        title: 'Konsep Akun',
        getTitle: (e) => "${e.levelmax} - ${e.digitmax}",
      );
}
