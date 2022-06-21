import 'package:get/get.dart';

import '../controllers/jurnal_manual_setup_controller.dart';

class JurnalManualSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JurnalManualSetupController>(
      () => JurnalManualSetupController(),
    );
  }
}
