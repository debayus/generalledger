import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void pengeluaranTunaiOnTab() {
    Helper.toNamed(Routes.TRANSAKSI_PENGELUARAN_TUNAI);
  }

  void neracaSaldoOnTab() {
    Helper.toNamed(Routes.LAPORAN_NERACA_SALDO);
  }

  void transaksiOnTab() {
    Helper.toNamed(Routes.TRANSAKSI);
  }

  void akunObTab() {
    Helper.toNamed(Routes.AKUN);
  }

  void laporanOnTab() {
    Helper.toNamed(Routes.LAPORAN);
  }

  void pengaturanOnTab() {
    Helper.toNamed(Routes.SETTINGS);
  }
}
