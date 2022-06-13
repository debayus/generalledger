import 'package:get/get.dart';

import '../controllers/settings_master_data_konsep_akun_controller.dart';

class SettingsMasterDataKonsepAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsMasterDataKonsepAkunController>(
      () => SettingsMasterDataKonsepAkunController(),
    );
  }
}
