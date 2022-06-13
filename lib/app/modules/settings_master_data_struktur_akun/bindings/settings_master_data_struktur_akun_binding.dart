import 'package:get/get.dart';

import '../controllers/settings_master_data_struktur_akun_controller.dart';

class SettingsMasterDataStrukturAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsMasterDataStrukturAkunController>(
      () => SettingsMasterDataStrukturAkunController(),
    );
  }
}
