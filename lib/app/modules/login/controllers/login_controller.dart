import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/components/inputs/input_text_component.dart';
import 'package:generalledger/app/utils/components/pages/setup_page_component.dart';
import 'package:generalledger/app/utils/mahas_server.dart';
import 'package:generalledger/app/utils/my_config.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formCon = SetupPageController(
    questionBack: false,
  );
  final nameCon = InputTextController();
  final emailCon = InputTextController();
  final passwordCon = InputTextController();
  final confirmPasswordCon = InputTextController();

  var state = 'Login'.obs;

  String? confirmPasswordValidator(value) {
    if (value != passwordCon.con.text) return 'Password are not match';
    return null;
  }

  void setState(String stateX) {
    state(stateX);
  }

  void forgotPasswordOnPress() {
    if (EasyLoading.isShow) return;
    state('Forgot Password');
  }

  void loginRegisterOnPress() {
    if (EasyLoading.isShow) return;
    state(state.value == 'Login' ? 'Register' : 'Login');
  }

  void onSubmit() async {
    if (EasyLoading.isShow) return;
    if (state.value == "Register" && !nameCon.isValid()) return;
    if (!emailCon.isValid()) return;
    if (!passwordCon.isValid()) return;
    if (!confirmPasswordCon.isValid()) return;

    if (state.value == 'Login') {
      if (await MahasServer.login(emailCon.con.text, passwordCon.con.text)) {
        if (await MyConfig.initLogin()) {
          Get.offAllNamed(Routes.LOGIN_REGISTER);
        } else {
          Get.offAllNamed(Routes.HOME);
        }
      }
    } else if (state.value == 'Register') {
      if (await MahasServer.registration(
        nameCon.con.text,
        emailCon.con.text,
        passwordCon.con.text,
      )) {
        Get.offAllNamed(Routes.LOGIN_REGISTER);
      }
    } else if (state.value == 'Forgot Password') {
      // MahasServer.forgotPassword(emailCon.con.text);
    }
  }

  @override
  void onInit() {
    formCon.onSubmit = onSubmit;
    nameCon.con.text = "test";
    emailCon.con.text = "bayusth@gmail.com";
    passwordCon.con.text = "12345678";
    confirmPasswordCon.con.text = "12345678";
    super.onInit();
  }

  @override
  void onClose() {
    emailCon.dispose();
    passwordCon.dispose();
    confirmPasswordCon.dispose();
  }
}
