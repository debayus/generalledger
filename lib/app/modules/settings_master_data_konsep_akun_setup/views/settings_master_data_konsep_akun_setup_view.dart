import 'package:flutter/material.dart';
import 'package:generalledger/app/models/konsep_akun_model.dart';
import 'package:generalledger/app/utils/components/inputs/input_detail_component.dart';
import 'package:generalledger/app/utils/components/inputs/input_text_component.dart';
import 'package:generalledger/app/utils/components/others/container_component.dart';
import 'package:generalledger/app/utils/components/others/text_component.dart';
import 'package:generalledger/app/utils/components/pages/setup_page_component.dart';

import 'package:get/get.dart';

import '../controllers/settings_master_data_konsep_akun_setup_controller.dart';

class SettingsMasterDataKonsepAkunSetupView
    extends GetView<SettingsMasterDataKonsepAkunSetupController> {
  @override
  Widget build(BuildContext context) => SetupPageComponent(
        controller: controller.formCon,
        title: 'Konsep Akun',
        childrenPadding: false,
        children: () => [
          ContainerComponent(
            marginTop: 0,
            marginBottom: 0,
            child: Column(
              children: [
                InputTextComponent(
                  label: 'Level Max',
                  controller: controller.levelmaxCon,
                  required: true,
                  editable: controller.formCon.editable,
                  type: InputTextType.number,
                ),
                InputTextComponent(
                  label: 'Digit Max',
                  controller: controller.digitmaxCon,
                  editable: controller.formCon.editable,
                  type: InputTextType.number,
                  required: true,
                ),
              ],
            ),
          ),
          InputDetailComponent(
            controller: controller.detailCon,
            editable: controller.formCon.editable,
            label: 'Detail',
            builder: (et) {
              final e = et as KonsepAkunDetailModel;
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent("Level : ${e.level}"),
                    Padding(padding: EdgeInsets.all(2)),
                    TextComponent(
                      "Digit : ${e.jumlahdigit}",
                      muted: true,
                    ),
                    Padding(padding: EdgeInsets.all(2)),
                  ],
                ),
              );
            },
            setup: (e) => Column(
              children: [
                InputTextComponent(
                  label: 'Level',
                  controller: controller.detailLevelCon,
                  required: true,
                  type: InputTextType.number,
                ),
                InputTextComponent(
                  label: 'Jumlah Digit',
                  controller: controller.detailJumlahDigitCon,
                  required: true,
                  type: InputTextType.number,
                ),
              ],
            ),
          ),
        ],
      );
}
