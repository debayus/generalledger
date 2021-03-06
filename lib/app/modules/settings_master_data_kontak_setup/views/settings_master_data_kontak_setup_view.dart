import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';

import 'package:get/get.dart';

import '../controllers/settings_master_data_kontak_setup_controller.dart';

class SettingsMasterDataKontakSetupView
    extends GetView<SettingsMasterDataKontakSetupController> {
  @override
  Widget build(BuildContext context) => SetupPageComponent(
        controller: controller.formCon,
        title: 'Kontak',
        children: () => [
          InputTextComponent(
            label: 'Nama',
            controller: controller.namaCon,
            required: true,
            editable: controller.formCon.editable,
          ),
          InputTextComponent(
            label: 'Telp',
            controller: controller.telpCon,
            editable: controller.formCon.editable,
          ),
          InputTextComponent(
            label: 'Whatsapp',
            controller: controller.whatsappCon,
            editable: controller.formCon.editable,
          ),
          InputTextComponent(
            label: 'Email',
            controller: controller.emailCon,
            editable: controller.formCon.editable,
          ),
          InputTextComponent(
            label: 'Perusahaan',
            controller: controller.perusahaanCon,
            editable: controller.formCon.editable,
          ),
          InputTextComponent(
            label: 'Alamat',
            controller: controller.alamatCon,
            editable: controller.formCon.editable,
          ),
          InputTextComponent(
            label: 'Catatan',
            controller: controller.catatanCon,
            editable: controller.formCon.editable,
          ),
        ],
      );
}
