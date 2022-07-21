import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';
import 'package:generalledger/app/mahas/services/mahas_server.dart';
import 'package:generalledger/app/mahas/my_config.dart';
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
    if (value != passwordCon.value) return 'Password are not match';
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
    if (state.value == "Register" && !nameCon.isValid) return;
    if (!emailCon.isValid) return;
    if (!passwordCon.isValid) return;
    if (!confirmPasswordCon.isValid) return;

    if (state.value == 'Login') {
      if (await MahasServer.login(emailCon.value, passwordCon.value)) {
        if (await MyConfig.initLogin()) {
          Get.offAllNamed(Routes.LOGIN_REGISTER);
        } else {
          Get.offAllNamed(Routes.HOME);
        }
      }
    } else if (state.value == 'Register') {
      if (await MahasServer.registration(
        nameCon.value,
        emailCon.value,
        passwordCon.value,
      )) {
        Get.offAllNamed(Routes.LOGIN_REGISTER);
      }
    } else if (state.value == 'Forgot Password') {
      // MahasServer.forgotPassword(emailCon.con.text);
    }
  }

  void sampleOnPress() {
    Helper.toNamed(Routes.XSAMPLE);
  }

  @override
  void onInit() {
    formCon.onSubmit = onSubmit;
    nameCon.value = "test";
    emailCon.value = "bayusth@gmail.com";
    passwordCon.value = "12345678";
    confirmPasswordCon.value = "12345678";
    super.onInit();
  }

  @override
  void onClose() {
    emailCon.dispose();
    passwordCon.dispose();
    confirmPasswordCon.dispose();
  }
}
