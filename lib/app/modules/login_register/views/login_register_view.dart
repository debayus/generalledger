import 'package:flutter/material.dart';
import 'package:generalledger/app/utils/components/inputs/input_text_component.dart';
import 'package:generalledger/app/utils/components/pages/setup_page_component.dart';
import 'package:get/get.dart';
import '../controllers/login_register_controller.dart';

class LoginRegisterView extends GetView<LoginRegisterController> {
  @override
  Widget build(BuildContext context) => SetupPageComponent(
        controller: controller.formCon,
        title: 'Daftar',
        children: () => [
          InputTextComponent(
            label: "Nama Perusahaan",
            controller: controller.namaCon,
            required: true,
            type: InputTextType.text,
          ),
          InputTextComponent(
            label: "Whatsapp",
            controller: controller.whatsapplCon,
            type: InputTextType.text,
          ),
          InputTextComponent(
            label: "Alamat",
            controller: controller.alamatlCon,
            type: InputTextType.paragraf,
          ),
        ],
      );
}
