import 'package:flutter/material.dart';
import 'package:generalledger/app/utils/components/others/image_text_horizontal_component.dart';
import 'package:generalledger/app/utils/components/others/text_component.dart';
import 'package:generalledger/app/utils/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/utils/my_config.dart';

import 'package:get/get.dart';

import '../controllers/laporan_controller.dart';

class LaporanView extends GetView<LaporanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextComponent(
            "Laporan",
            color: MyConfig.primaryColorRevenge,
            size: TextSize.h6,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageTextHorizontalComponent(
                ontap: controller.jurnalUmumObTab,
                imageMenu: false,
                iconData: FontAwesome5.book,
                showUnderline: true,
                menuName: "Jurnal Umum",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.bukuBesarOnTab,
                imageMenu: false,
                iconData: FontAwesome5.book,
                showUnderline: true,
                menuName: "Buku Besar",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.neracaOnTab,
                imageMenu: false,
                iconData: FontAwesome5.book,
                showUnderline: true,
                menuName: "Neraca Saldo",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.neracaOnTab,
                imageMenu: false,
                iconData: FontAwesome5.book,
                showUnderline: true,
                menuName: "Neraca",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.labaRugiOnTab,
                imageMenu: false,
                iconData: FontAwesome5.book,
                showUnderline: true,
                menuName: "Laba Rugi",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.saldoAkhirOnTab,
                imageMenu: false,
                iconData: FontAwesome5.book,
                showUnderline: true,
                menuName: "Saldo Akhir",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.saldoPerioseOnTab,
                imageMenu: false,
                iconData: FontAwesome5.book,
                showUnderline: true,
                menuName: "Saldo Periode",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.saldoBulananOnTab,
                imageMenu: false,
                iconData: FontAwesome5.book,
                showUnderline: true,
                menuName: "Saldo Bulanan",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.saldoTahunanOnTab,
                imageMenu: false,
                iconData: FontAwesome5.book,
                showUnderline: true,
                menuName: "Saldo Tahunan",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.dataHutangOnTab,
                imageMenu: false,
                iconData: FontAwesome5.book,
                showUnderline: true,
                menuName: "Data Hutang",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.dataPiutangOnTab,
                imageMenu: false,
                iconData: FontAwesome5.book,
                showUnderline: true,
                menuName: "Data Piutang",
              ),
            ],
          ),
        ));
  }
}
