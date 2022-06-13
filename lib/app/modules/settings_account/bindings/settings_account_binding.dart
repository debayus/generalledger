import 'package:get/get.dart';

import '../controllers/settings_account_controller.dart';

class SettingsAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsAccountController>(
      () => SettingsAccountController(),
    );
  }
}
