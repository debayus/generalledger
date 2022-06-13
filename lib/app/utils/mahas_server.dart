import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/http_api.dart';
import 'package:generalledger/app/utils/my_config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:generalledger/app/utils/helper.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MahasServer {
  static final storange = GetStorage();
  static PackageInfo? packageInfo;
  static String? token;

  static Future<String?> init() async {
    try {
      token = storange.read<String>('token');
      if (token != null) {
        if (await MyConfig.initLogin()) {
          return Routes.LOGIN_REGISTER;
        } else {
          return Routes.HOME;
        }
      } else {
        return Routes.LOGIN;
      }
    } catch (e) {
      await Helper.dialogWarning('$e');
      return null;
    }
  }

  static Future<bool> registration(
    String? name,
    String? email,
    String? password,
  ) async {
    if (EasyLoading.isShow) return false;
    try {
      await EasyLoading.show();
      var r = await HttpApi.apiPost('/api/register', body: {
        "name": name,
        "email": email,
        "password": password,
      });
      await EasyLoading.dismiss();
      if (r.success) {
        token = r.body['access_token'];
        storange.write('token', token);
        return true;
      } else {
        await Helper.dialogWarning(r.message!);
        return false;
      }
    } catch (e) {
      await EasyLoading.dismiss();
      await Helper.dialogWarning('$e');
      return false;
    }
  }

  static Future<bool> login(String? email, String? password) async {
    if (EasyLoading.isShow) return false;
    try {
      await EasyLoading.show();
      var r = await HttpApi.apiPost('/api/login', body: {
        "email": email,
        "password": password,
      });
      await EasyLoading.dismiss();
      if (r.success) {
        token = r.body['access_token'];
        storange.write('token', token);
        return true;
      } else {
        await Helper.dialogWarning(r.message!);
        return false;
      }
    } catch (e) {
      await EasyLoading.dismiss();
      await Helper.dialogWarning('$e');
    }
    return false;
  }

  static Future logout() async {
    if (EasyLoading.isShow) return;
    await EasyLoading.show();

    await EasyLoading.dismiss();
  }
}
