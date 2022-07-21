import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/others/button_component.dart';
import 'package:generalledger/app/mahas/components/others/container_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/my_config.dart';
import 'package:get/get.dart';
import '../controllers/xsample_input_controller.dart';

class XsampleInputView extends GetView<XsampleInputController> {
  const XsampleInputView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextComponent(
          'Input',
          color: MyConfig.primaryColorRevenge,
          size: TextSize.h6,
        ),
        centerTitle: true,
      ),
      body: ContainerComponent(
        child: Obx(
          () => Column(
            children: [
              InputTextComponent(
                label: "Text",
                controller: controller.inputTextCon,
                editable: controller.editable.value,
                required: true,
              ),
              InputTextComponent(
                label: "Email",
                controller: controller.inputEmailCon,
                editable: controller.editable.value,
                required: true,
                type: InputTextType.email,
              ),
              InputTextComponent(
                label: "Money",
                controller: controller.inputMoneyCon,
                editable: controller.editable.value,
                required: true,
                type: InputTextType.money,
              ),
              InputTextComponent(
                label: "Number",
                controller: controller.inputNumberCon,
                editable: controller.editable.value,
                required: true,
                type: InputTextType.number,
              ),
              InputTextComponent(
                label: "paragraf",
                controller: controller.inputParagrafCon,
                editable: controller.editable.value,
                required: true,
                type: InputTextType.paragraf,
              ),
              InputTextComponent(
                label: "Password",
                controller: controller.inputPasswordCon,
                editable: controller.editable.value,
                required: true,
                type: InputTextType.password,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
