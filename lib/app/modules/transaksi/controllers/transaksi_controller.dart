import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/helper.dart';
import 'package:get/get.dart';

class TransaksiController extends GetxController {
  void pemasukanTunaiOnTab() {}
  void pemasukanSebagaiPiutangOnTab() {}
  void pengeluaranTunaiOnTab() {}
  void pengeluaranSebagaiHutangOnTab() {}
  void tambahHutangOnTab() {}
  void bayarPiutangOnTab() {}
  void tambahPiutangOnTab() {}
  void penyetoranPiutangOnTab() {}
  void tambahModalOnTab() {}
  void tarikModalOnTab() {}
  void pengalihanAsetOnTab() {}
  void pendapatanDiterimaDimukaOnTab() {}
  void penyesuaianHutangOnTab() {}
  void setSaldoAwalOnTab() {}
  void jurnalManualOnTab() {
    Helper.toNamed(Routes.TRANSAKSI_JURNAL_MANUAL);
  }
}
