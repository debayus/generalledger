import 'package:get/get.dart';

import '../controllers/settings_master_data_proyek_setup_controller.dart';

class SettingsMasterDataProyekSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsMasterDataProyekSetupController>(
      () => SettingsMasterDataProyekSetupController(),
    );
  }
}
