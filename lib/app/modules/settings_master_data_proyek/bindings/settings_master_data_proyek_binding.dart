import 'package:get/get.dart';

import '../controllers/settings_master_data_proyek_controller.dart';

class SettingsMasterDataProyekBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsMasterDataProyekController>(
      () => SettingsMasterDataProyekController(),
    );
  }
}
