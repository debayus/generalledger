import 'package:get/get.dart';

import '../controllers/jurnal_manual_controller.dart';

class JurnalManualBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JurnalManualController>(
      () => JurnalManualController(),
    );
  }
}
