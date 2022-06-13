import 'package:get/get.dart';

import '../controllers/settings_master_data_konsep_akun_setup_controller.dart';

class SettingsMasterDataKonsepAkunSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsMasterDataKonsepAkunSetupController>(
      () => SettingsMasterDataKonsepAkunSetupController(),
    );
  }
}
