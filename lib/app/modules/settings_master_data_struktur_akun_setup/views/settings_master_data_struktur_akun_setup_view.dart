import 'package:flutter/material.dart';
import 'package:generalledger/app/models/struktur_akun_model.dart';
import 'package:generalledger/app/mahas/components/inputs/input_checkbox_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_detail_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_dropdown_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/others/container_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';

import 'package:get/get.dart';

import '../controllers/settings_master_data_struktur_akun_setup_controller.dart';

class SettingsMasterDataStrukturAkunSetupView
    extends GetView<SettingsMasterDataStrukturAkunSetupController> {
  @override
  Widget build(BuildContext context) => SetupPageComponent(
        controller: controller.formCon,
        title: 'Struktur Akun',
        childrenPadding: false,
        children: () => [
          ContainerComponent(
            marginTop: 0,
            marginBottom: 0,
            child: Column(
              children: [
                InputDropdownComponent(
                  controller: controller.jenisCon,
                  itemLabel: (e) => e as String,
                  label: 'Jenis',
                  required: true,
                  editable: controller.formCon.editable,
                ),
                InputTextComponent(
                  label: 'Nama',
                  controller: controller.namaCon,
                  required: true,
                  editable: controller.formCon.editable,
                ),
                InputTextComponent(
                  label: 'Keterangan',
                  controller: controller.keteranganCon,
                  editable: controller.formCon.editable,
                  type: InputTextType.paragraf,
                ),
              ],
            ),
          ),
          InputDetailComponent(
            controller: controller.detailCon,
            editable: controller.formCon.editable,
            label: 'Group Detail',
            builder: (et) {
              final e = et as StrukturAkunDetailModel;
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent(e.nama!),
                    Padding(padding: EdgeInsets.all(2)),
                    TextComponent(
                      e.cash == true ? 'Cash : Ya' : 'Cash : Tidak',
                      muted: true,
                    ),
                    Padding(padding: EdgeInsets.all(1)),
                    TextComponent(
                      e.bank == true ? 'Bank : Ya' : 'Bank : Tidak',
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
                  label: 'Nama',
                  controller: controller.detailNamaCon,
                  required: true,
                ),
                InputCheckboxComponent(
                  label: 'Cash',
                  controller: controller.detailCashCon,
                ),
                InputCheckboxComponent(
                  label: 'Bank',
                  controller: controller.detailBankCon,
                ),
              ],
            ),
          ),
        ],
      );
}
