import 'package:get/get.dart';

import '../controllers/settings_master_data_kontak_setup_controller.dart';

class SettingsMasterDataKontakSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsMasterDataKontakSetupController>(
      () => SettingsMasterDataKontakSetupController(),
    );
  }
}
