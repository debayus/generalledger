import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';

import 'package:get/get.dart';

import '../controllers/settings_master_data_proyek_setup_controller.dart';

class SettingsMasterDataProyekSetupView
    extends GetView<SettingsMasterDataProyekSetupController> {
  @override
  Widget build(BuildContext context) => SetupPageComponent(
        controller: controller.formCon,
        title: 'Proyek',
        children: () => [
          InputTextComponent(
            label: 'Nama',
            controller: controller.namaCon,
            required: true,
            editable: controller.formCon.editable,
          ),
        ],
      );
}
