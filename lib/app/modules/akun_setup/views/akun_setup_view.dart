import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_dropdown_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';
import 'package:get/get.dart';
import '../controllers/akun_setup_controller.dart';

class AkunSetupView extends GetView<AkunSetupController> {
  @override
  Widget build(BuildContext context) => SetupPageComponent(
        controller: controller.formCon,
        title: 'Akun',
        children: () => [
          InputDropdownComponent(
            label: 'Komponen',
            controller: controller.komponenCon,
            required: true,
            editable: controller.formCon.editable,
          ),
          InputDropdownComponent(
            label: 'Group',
            controller: controller.groupCon,
            required: true,
            editable: controller.formCon.editable,
          ),
          InputDropdownComponent(
            label: 'Sub Group',
            controller: controller.subGroupCon,
            editable: controller.formCon.editable,
          ),
          InputDropdownComponent(
            label: 'Normal Pos',
            controller: controller.normalPosCon,
            required: true,
            editable: controller.formCon.editable,
          ),
          InputDropdownComponent(
            label: 'Level',
            controller: controller.levelCon,
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
