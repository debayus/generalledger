import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_checkbox_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_radio_component.dart';
import 'package:generalledger/app/mahas/components/others/button_component.dart';
import 'package:generalledger/app/mahas/components/others/container_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/my_config.dart';

import 'package:get/get.dart';

import '../controllers/xsample_checkbox_radio_controller.dart';

class XsampleCheckboxRadioView extends GetView<XsampleCheckboxRadioController> {
  const XsampleCheckboxRadioView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextComponent(
          'Checkbox & Radio',
          color: MyConfig.primaryColorRevenge,
          size: TextSize.h6,
        ),
        centerTitle: true,
      ),
      body: ContainerComponent(
        child: Obx(
          () => Column(
            children: [
              InputCheckboxComponent(
                controller: controller.checkboxCon,
                editable: controller.editable.value,
                label: 'Checkbox',
              ),
              InputCheckboxComponent(
                controller: controller.switchCon,
                editable: controller.editable.value,
                isSwitch: true,
                label: 'Switch',
              ),
              InputRadioComponent(
                controller: controller.radioCon,
                editable: controller.editable.value,
                required: true,
                label: 'Radio',
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
