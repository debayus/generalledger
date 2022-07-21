import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/others/image_text_horizontal_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/mahas/my_config.dart';

import 'package:get/get.dart';

import '../controllers/xsample_controller.dart';

class XsampleView extends GetView<XsampleController> {
  const XsampleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextComponent(
            "Sample",
            color: MyConfig.primaryColorRevenge,
            size: TextSize.h6,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageTextHorizontalComponent(
                ontap: controller.inputOnPress,
                imageMenu: false,
                iconData: FontAwesome5.rocket,
                showUnderline: true,
                menuName: "Input",
              ),
              ImageTextHorizontalComponent(
                ontap: controller.checkboxRadioOnPress,
                imageMenu: false,
                iconData: FontAwesome5.rocket,
                showUnderline: true,
                menuName: "Checkbox & Radio",
              ),
            ],
          ),
        ));
  }
}
