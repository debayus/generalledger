import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_datetime_component.dart';
import 'package:generalledger/app/mahas/components/others/button_component.dart';
import 'package:generalledger/app/mahas/components/others/container_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/my_config.dart';

import 'package:get/get.dart';

import '../controllers/xsample_date_time_controller.dart';

class XsampleDateTimeView extends GetView<XsampleDateTimeController> {
  const XsampleDateTimeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextComponent(
          'Date & Time',
          color: MyConfig.primaryColorRevenge,
          size: TextSize.h6,
        ),
        centerTitle: true,
      ),
      body: ContainerComponent(
        child: Obx(
          () => Column(
            children: [
              InputDatetimeComponent(
                controller: controller.dateCon,
                editable: controller.editable.value,
                required: true,
                label: 'Date',
              ),
              InputDatetimeComponent(
                controller: controller.timeCon,
                editable: controller.editable.value,
                required: true,
                label: 'Time',
                type: InputDatetimeType.time,
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
