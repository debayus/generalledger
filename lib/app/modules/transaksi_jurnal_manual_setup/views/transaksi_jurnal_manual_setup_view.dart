import 'package:flutter/material.dart';
import 'package:generalledger/app/models/jurnal_model.dart';
import 'package:generalledger/app/models/proyek_model.dart';
import 'package:generalledger/app/mahas/components/inputs/input_datetime_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_detail_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_dropdown_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/others/container_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:generalledger/app/mahas/my_config.dart';

import 'package:get/get.dart';

import '../controllers/transaksi_jurnal_manual_setup_controller.dart';

class TransaksiJurnalManualSetupView
    extends GetView<TransaksiJurnalManualSetupController> {
  @override
  Widget build(BuildContext context) => SetupPageComponent(
        controller: controller.formCon,
        title: 'Jurnal',
        childrenPadding: false,
        children: () => [
          ContainerComponent(
            marginBottom: 0,
            marginTop: 0,
            child: Column(
              children: [
                InputTextComponent(
                  label: 'No',
                  controller: controller.noCon,
                  editable: false,
                ),
                InputDropdownComponent<ProyekModel>(
                  label: 'Proyek',
                  controller: controller.idProyekCon,
                  itemLabel: (e) => e?.nama ?? "",
                  required: true,
                  editable: controller.formCon.editable,
                ),
                InputDatetimeComponent(
                  label: 'Tanggal',
                  controller: controller.tanggalCon,
                  required: true,
                  editable: controller.formCon.editable,
                ),
                InputTextComponent(
                  label: 'Catatan',
                  controller: controller.catatanCon,
                  editable: controller.formCon.editable,
                  type: InputTextType.paragraf,
                ),
              ],
            ),
          ),
          InputDetailComponent(
            controller: controller.detailCon,
            editable: controller.formCon.editable,
            label: 'Detail',
            builder: (et) {
              final e = et as JurnalDetailModel;
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent(
                      "${e.no} - ${e.nama}",
                      fontWeight: FontWeight.w600,
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              TextComponent(
                                "D : ",
                                muted: true,
                              ),
                              TextComponent(
                                Helper.currencyFormat(e.debit,
                                    zeroIsEmpty: false),
                                color: MyConfig.colorBlue,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              TextComponent(
                                "K : ",
                                muted: true,
                              ),
                              TextComponent(
                                Helper.currencyFormat(e.kredit,
                                    zeroIsEmpty: false),
                                color: MyConfig.colorRed,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    TextComponent(
                      'catatan : ${e.catatan ?? '-'}',
                      muted: true,
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                  ],
                ),
              );
            },
            setup: (e) => Column(
              children: [
                InputTextComponent(
                  label: 'Debit',
                  controller: controller.detailDebitCon,
                  type: InputTextType.money,
                ),
                InputTextComponent(
                  label: 'Kredit',
                  controller: controller.detailKreditCon,
                  type: InputTextType.money,
                ),
              ],
            ),
          ),
        ],
      );
}
