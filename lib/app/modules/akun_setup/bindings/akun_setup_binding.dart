import 'package:get/get.dart';

import '../controllers/akun_setup_controller.dart';

class AkunSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AkunSetupController>(
      () => AkunSetupController(),
    );
  }
}
