import 'package:get/get.dart';

import '../controllers/settings_master_data_kontak_controller.dart';

class SettingsMasterDataKontakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsMasterDataKontakController>(
      () => SettingsMasterDataKontakController(),
    );
  }
}
