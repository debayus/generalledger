import 'package:get/get.dart';

import '../controllers/transaksi_jurnal_manual_setup_controller.dart';

class TransaksiJurnalManualSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiJurnalManualSetupController>(
      () => TransaksiJurnalManualSetupController(),
    );
  }
}
