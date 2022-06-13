import 'package:flutter/material.dart';
import 'package:generalledger/app/utils/components/inputs/input_text_component.dart';
import 'package:generalledger/app/utils/components/pages/setup_page_component.dart';
import 'package:generalledger/app/utils/my_config.dart';
import 'package:get/get.dart';
import 'package:generalledger/app/utils/components/others/text_component.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) => SetupPageComponent(
        controller: controller.formCon,
        showAppBar: false,
        children: () => [
          Padding(padding: EdgeInsets.all(20)),
          Container(
            height: 80,
            child: Image.asset('assets/images/logo.png'),
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextComponent(
            "General Ledger",
            size: TextSize.h2,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextComponent(
            "Selamat datang di General Ledger",
            textAlign: TextAlign.center,
            muted: true,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Obx(
            () => controller.state.value == 'Register'
                ? Column(
                    children: [
                      InputTextComponent(
                        label: "Name",
                        controller: controller.nameCon,
                        required: true,
                      ),
                    ],
                  )
                : SizedBox.shrink(),
          ),
          InputTextComponent(
            label: "Email",
            controller: controller.emailCon,
            required: true,
            type: InputTextType.email,
          ),
          Obx(
            () => controller.state.value != 'Forgot Password'
                ? InputTextComponent(
                    label: "Password",
                    controller: controller.passwordCon,
                    required: true,
                    type: InputTextType.password,
                  )
                : SizedBox.shrink(),
          ),
          Obx(
            () => controller.state.value == 'Login'
                ? Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: controller.forgotPasswordOnPress,
                      child: TextComponent(
                        "Lupa Password?",
                        color: MyConfig.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
          Obx(
            () => controller.state.value == 'Register'
                ? Column(
                    children: [
                      InputTextComponent(
                        label: "Confirm Password",
                        controller: controller.confirmPasswordCon,
                        validator: controller.confirmPasswordValidator,
                        type: InputTextType.password,
                      ),
                    ],
                  )
                : SizedBox.shrink(),
          ),
        ],
        childrenAfterButton: [
          Padding(padding: EdgeInsets.all(5)),
          InkWell(
            onTap: controller.loginRegisterOnPress,
            child: Obx(
              () => TextComponent(
                controller.state.value == 'Login' ? 'Daftar' : "Login",
                color: MyConfig.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
        ],
      );
}
