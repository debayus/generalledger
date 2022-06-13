import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/helper.dart';
import 'package:get/get.dart';

class SettingsMasterDataController extends GetxController {
  void strukturAkunOnTab() {
    Helper.toNamed(Routes.SETTINGS_MASTER_DATA_STRUKTUR_AKUN);
  }

  void konsepAkunOnTab() {
    Helper.toNamed(Routes.SETTINGS_MASTER_DATA_KONSEP_AKUN);
  }

  void akunLabaRugiOnTab() {
    Helper.toNamed(Routes.SETTINGS_MASTER_DATA_AKUN_LABA_RUGI);
  }

  void kontakOnTab() {
    Helper.toNamed(Routes.SETTINGS_MASTER_DATA_KONTAK);
  }

  void proyekOnTab() {
    Helper.toNamed(Routes.SETTINGS_MASTER_DATA_PROYEK);
  }
}
