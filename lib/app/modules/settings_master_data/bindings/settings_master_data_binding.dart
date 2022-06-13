import 'package:get/get.dart';

import '../controllers/settings_master_data_controller.dart';

class SettingsMasterDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsMasterDataController>(
      () => SettingsMasterDataController(),
    );
  }
}
