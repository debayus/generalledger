import 'package:get/get.dart';

import '../controllers/settings_changeemail_controller.dart';

class SettingsChangeemailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsChangeemailController>(
      () => SettingsChangeemailController(),
    );
  }
}
