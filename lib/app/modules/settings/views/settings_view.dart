import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/others/image_text_horizontal_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/mahas/my_config.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextComponent(
            "Pengaturan",
            color: MyConfig.primaryColorRevenge,
            size: TextSize.h6,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageTextHorizontalComponent(
                ontap: controller.accountOnTab,
                imageMenu: false,
                iconData: FontAwesome5.user,
                showUnderline: true,
                menuName: "Account",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.perusahaanOnTab,
                imageMenu: false,
                iconData: FontAwesome5.building,
                showUnderline: true,
                menuName: "Perusahaan",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.masterDataOnTab,
                imageMenu: false,
                iconData: FontAwesome5.database,
                showUnderline: true,
                menuName: "Master Data",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.changePasswordOnTab,
                imageMenu: false,
                iconData: FontAwesome5.lock,
                showUnderline: true,
                menuName: "Change Password",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.deleteAccountOnTab,
                imageMenu: false,
                iconData: FontAwesome5.user_times,
                showUnderline: true,
                menuName: "Delete Account",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.logOutOnTab,
                imageMenu: false,
                iconData: FontAwesome5.sign_out_alt,
                showUnderline: true,
                menuName: "Log Out",
              ),
            ],
          ),
        ));
  }
}
