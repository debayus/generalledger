import 'package:get/get.dart';

import '../controllers/settings_deleteaccount_controller.dart';

class SettingsDeleteaccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsDeleteaccountController>(
      () => SettingsDeleteaccountController(),
    );
  }
}
