import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_dropdown_component.dart';
import 'package:generalledger/app/mahas/components/others/button_component.dart';
import 'package:generalledger/app/mahas/components/others/container_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/my_config.dart';

import 'package:get/get.dart';

import '../controllers/xsample_drop_down_controller.dart';

class XsampleDropDownView extends GetView<XsampleDropDownController> {
  const XsampleDropDownView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextComponent(
          'Drop down',
          color: MyConfig.primaryColorRevenge,
          size: TextSize.h6,
        ),
        centerTitle: true,
      ),
      body: ContainerComponent(
        child: Obx(
          () => Column(
            children: [
              InputDropdownComponent(
                controller: controller.dropdownCon,
                editable: controller.editable.value,
                required: true,
                label: 'Drop Down',
              ),
              ButtonComponent(
                label: "Validate",
                onPressed: controller.validateOnPress,
                marginBottom: 10,
              ),
              ButtonComponent(
                label: "Change Editable",
                onPressed: controller.changeEditableOnPress,
                marginBottom: 10,
              ),
              ButtonComponent(
                label: "Set Value",
                onPressed: controller.setValueOnPress,
                marginBottom: 10,
              ),
              ButtonComponent(
                label: "Get Value",
                onPressed: controller.getValueOnPress,
              )
            ],
          ),
        ),
      ),
    );
  }
}
