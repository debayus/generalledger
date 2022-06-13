import 'package:get/get.dart';

import '../controllers/settings_master_data_akun_laba_rugi_controller.dart';

class SettingsMasterDataAkunLabaRugiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsMasterDataAkunLabaRugiController>(
      () => SettingsMasterDataAkunLabaRugiController(),
    );
  }
}
