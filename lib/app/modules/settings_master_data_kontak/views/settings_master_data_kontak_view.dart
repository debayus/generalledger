import 'package:flutter/material.dart';
import 'package:generalledger/app/models/kontak_model.dart';
import 'package:generalledger/app/mahas/components/pages/list_page_component.dart';

import 'package:get/get.dart';

import '../controllers/settings_master_data_kontak_controller.dart';

class SettingsMasterDataKontakView
    extends GetView<SettingsMasterDataKontakController> {
  @override
  Widget build(BuildContext context) => ListPageComponent<KontakModel>(
        controller: controller.listCon,
        title: 'Kontak',
        getTitle: (e) => e.nama ?? "-",
      );
}
