import 'package:get/get.dart';

import '../controllers/transaksi_pengeluaran_tunai_controller.dart';

class TransaksiPengeluaranTunaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiPengeluaranTunaiController>(
      () => TransaksiPengeluaranTunaiController(),
    );
  }
}
