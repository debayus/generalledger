import 'package:flutter/material.dart';
import 'package:generalledger/app/models/proyek_model.dart';
import 'package:generalledger/app/mahas/components/pages/list_page_component.dart';

import 'package:get/get.dart';

import '../controllers/settings_master_data_proyek_controller.dart';

class SettingsMasterDataProyekView
    extends GetView<SettingsMasterDataProyekController> {
  @override
  Widget build(BuildContext context) => ListPageComponent<ProyekModel>(
        controller: controller.listCon,
        title: 'Proyek',
        getTitle: (e) => e.nama ?? "-",
      );
}
