import 'package:flutter/material.dart';
import 'package:generalledger/app/models/struktur_akun_model.dart';
import 'package:generalledger/app/utils/components/pages/list_page_component.dart';

import 'package:get/get.dart';

import '../controllers/settings_master_data_struktur_akun_controller.dart';

class SettingsMasterDataStrukturAkunView
    extends GetView<SettingsMasterDataStrukturAkunController> {
  @override
  Widget build(BuildContext context) => ListPageComponent<StrukturAkunModel>(
        controller: controller.listCon,
        title: 'Struktur Akun',
        getTitle: (e) => "${e.jenis} - ${e.nama}",
      );
}
