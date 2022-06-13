import 'package:get/get.dart';

import '../controllers/settings_changepassword_controller.dart';

class SettingsChangepasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsChangepasswordController>(
      () => SettingsChangepasswordController(),
    );
  }
}
