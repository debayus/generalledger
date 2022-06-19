import 'package:flutter/material.dart';
import 'package:generalledger/app/models/struktur_akun_model.dart';
import 'package:generalledger/app/utils/components/inputs/input_dropdown_component.dart';
import 'package:generalledger/app/utils/components/inputs/input_text_component.dart';
import 'package:generalledger/app/utils/components/pages/setup_page_component.dart';

import 'package:get/get.dart';

import '../controllers/akun_setup_controller.dart';

class AkunSetupView extends GetView<AkunSetupController> {
  @override
  Widget build(BuildContext context) => SetupPageComponent(
        controller: controller.formCon,
        title: 'Akun',
        children: () => [
          InputDropdownComponent<String>(
            label: 'Komponen',
            controller: controller.komponenCon,
            itemLabel: (e) => e ?? "",
            required: true,
            editable: controller.formCon.editable,
          ),
          InputDropdownComponent<StrukturAkunModel>(
            label: 'Group',
            controller: controller.groupCon,
            itemLabel: (e) => e?.nama ?? "",
            required: true,
            editable: controller.formCon.editable,
          ),
          InputDropdownComponent<StrukturAkunDetailModel>(
            label: 'Sub Group',
            controller: controller.subGroupCon,
            itemLabel: (e) => e?.nama ?? "",
            editable: controller.formCon.editable,
          ),
          InputDropdownComponent<String>(
            label: 'Normal Pos',
            controller: controller.normalPosCon,
            itemLabel: (e) => e ?? "",
            required: true,
            editable: controller.formCon.editable,
          ),
          InputDropdownComponent<int>(
            label: 'Level',
            controller: controller.levelCon,
            itemLabel: (e) => '$e',
            required: true,
            editable: controller.formCon.editable,
          ),
          InputTextComponent(
            label: 'No Akun',
            controller: controller.noCon,
            required: true,
            editable: controller.formCon.editable,
          ),
          InputTextComponent(
            label: 'Nama',
            controller: controller.namaCon,
            required: true,
            editable: controller.formCon.editable,
          ),
        ],
      );
}
