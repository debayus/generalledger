import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/helper.dart';
import 'package:generalledger/app/utils/mahas_server.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  void logOutOnTab() {
    MahasServer.storange.remove('token');
    Helper.toNamed(Routes.LOGIN);
  }

  void accountOnTab() {}
  void masterDataOnTab() {
    Helper.toNamed(Routes.SETTINGS_MASTER_DATA);
  }

  void perusahaanOnTab() {}
  void changePasswordOnTab() {}
  void deleteAccountOnTab() {}
}
