import 'package:get/get.dart';

import '../controllers/transaksi_jurnal_manual_controller.dart';

class TransaksiJurnalManualBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiJurnalManualController>(
      () => TransaksiJurnalManualController(),
    );
  }
}
