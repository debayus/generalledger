import 'package:flutter/material.dart';
import 'package:generalledger/app/utils/components/others/image_text_horizontal_component.dart';
import 'package:generalledger/app/utils/components/others/text_component.dart';
import 'package:generalledger/app/utils/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/utils/my_config.dart';

import 'package:get/get.dart';

import '../controllers/settings_master_data_controller.dart';

class SettingsMasterDataView extends GetView<SettingsMasterDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextComponent(
            "Master Data",
            color: MyConfig.primaryColorRevenge,
            size: TextSize.h6,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageTextHorizontalComponent(
                ontap: controller.strukturAkunOnTab,
                imageMenu: false,
                iconData: FontAwesome5.cog,
                showUnderline: true,
                menuName: "Struktur Akun",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.konsepAkunOnTab,
                imageMenu: false,
                iconData: FontAwesome5.cog,
                showUnderline: true,
                menuName: "Konsep Akun",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.akunLabaRugiOnTab,
                imageMenu: false,
                iconData: FontAwesome5.cog,
                showUnderline: true,
                menuName: "Akun Laba Rugi",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.kontakOnTab,
                imageMenu: false,
                iconData: FontAwesome5.address_book,
                showUnderline: true,
                menuName: "Kontak",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.proyekOnTab,
                imageMenu: false,
                iconData: FontAwesome5.clipboard_list,
                showUnderline: true,
                menuName: "Proyek",
              ),
            ],
          ),
        ));
  }
}
