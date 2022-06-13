import 'package:flutter/material.dart';
import 'package:generalledger/app/utils/components/others/image_text_horizontal_component.dart';
import 'package:generalledger/app/utils/components/others/text_component.dart';
import 'package:generalledger/app/utils/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/utils/my_config.dart';

import 'package:get/get.dart';

import '../controllers/transaksi_controller.dart';

class TransaksiView extends GetView<TransaksiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextComponent(
            "Transaksi",
            color: MyConfig.primaryColorRevenge,
            size: TextSize.h6,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageTextHorizontalComponent(
                ontap: controller.pemasukanTunaiOnTab,
                imageMenu: false,
                iconData: FontAwesome5.arrow_right,
                showUnderline: true,
                menuName: "Pemasukan Tunai",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.pemasukanSebagaiPiutangOnTab,
                imageMenu: false,
                iconData: FontAwesome5.arrow_right,
                showUnderline: true,
                menuName: "Pemasukan Sebagai Piutang",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.pengeluaranTunaiOnTab,
                imageMenu: false,
                iconData: FontAwesome5.arrow_left,
                showUnderline: true,
                menuName: "Pengeluaran Tunai",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.pengeluaranSebagaiHutangOnTab,
                imageMenu: false,
                iconData: FontAwesome5.arrow_left,
                showUnderline: true,
                menuName: "Pengeluaran Sebai Hutang",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.tambahHutangOnTab,
                imageMenu: false,
                iconData: FontAwesome5.angle_double_right,
                showUnderline: true,
                menuName: "Tambah Hutang",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.bayarPiutangOnTab,
                imageMenu: false,
                iconData: FontAwesome5.angle_double_left,
                showUnderline: true,
                menuName: "Bayar Piutang",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.tambahPiutangOnTab,
                imageMenu: false,
                iconData: FontAwesome5.angle_double_up,
                showUnderline: true,
                menuName: "Tambah Piutang",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.penyetoranPiutangOnTab,
                imageMenu: false,
                iconData: FontAwesome5.angle_double_down,
                showUnderline: true,
                menuName: "Penyetoran Piutang",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.tambahModalOnTab,
                imageMenu: false,
                iconData: FontAwesome5.hand_point_right,
                showUnderline: true,
                menuName: "Tambah Modal",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.tarikModalOnTab,
                imageMenu: false,
                iconData: FontAwesome5.hand_point_left,
                showUnderline: true,
                menuName: "Tarik Modal",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.pengalihanAsetOnTab,
                imageMenu: false,
                iconData: FontAwesome5.expand_alt,
                showUnderline: true,
                menuName: "Pengalihan Aset",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.pendapatanDiterimaDimukaOnTab,
                imageMenu: false,
                iconData: FontAwesome5.angle_double_right,
                showUnderline: true,
                menuName: "Pendapatan Diterima Dimuka",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.penyesuaianHutangOnTab,
                imageMenu: false,
                iconData: FontAwesome5.expand_alt,
                showUnderline: true,
                menuName: "Penyesuaian Hutang",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.setSaldoAwalOnTab,
                imageMenu: false,
                iconData: FontAwesome5.expand_arrows_alt,
                showUnderline: true,
                menuName: "Set Saldo Awal",
              ),
            ],
          ),
        ));
  }
}
