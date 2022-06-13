import 'package:get/get.dart';

import '../controllers/settings_master_data_struktur_akun_setup_controller.dart';

class SettingsMasterDataStrukturAkunSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsMasterDataStrukturAkunSetupController>(
      () => SettingsMasterDataStrukturAkunSetupController(),
    );
  }
}
