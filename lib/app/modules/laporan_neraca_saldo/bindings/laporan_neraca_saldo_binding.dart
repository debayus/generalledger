import 'package:get/get.dart';

import '../controllers/laporan_neraca_saldo_controller.dart';

class LaporanNeracaSaldoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanNeracaSaldoController>(
      () => LaporanNeracaSaldoController(),
    );
  }
}
