import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:generalledger/app/mahas/services/http_api.dart';
import 'package:get/get.dart';

class LoginRegisterController extends GetxController {
  final formCon = SetupPageController(
    pageBack: Routes.LOGIN,
  );
  final namaCon = InputTextController();
  final emailCon = InputTextController();
  final telplCon = InputTextController();
  final whatsapplCon = InputTextController();
  final alamatlCon = InputTextController();

  void onSubmit() async {
    if (EasyLoading.isShow) return;
    if (!namaCon.isValid()) return;
    if (!emailCon.isValid()) return;
    if (!telplCon.isValid()) return;
    if (!whatsapplCon.isValid()) return;
    if (!alamatlCon.isValid()) return;

    try {
      await EasyLoading.show();
      var r = await HttpApi.apiPost('/api/perusahaan', body: {
        "nama": namaCon.con.text,
        "email": emailCon.con.text,
        "telp": telplCon.con.text,
        "whatsapp": whatsapplCon.con.text,
        "alamat": alamatlCon.con.text,
      });
      await EasyLoading.dismiss();
      if (r.success) {
        Helper.toNamed(Routes.HOME);
      } else {
        await Helper.dialogWarning(r.message!);
      }
    } catch (e) {
      await EasyLoading.dismiss();
      await Helper.dialogWarning('$e');
    }
  }

  @override
  void onInit() {
    formCon.onSubmit = onSubmit;
    super.onInit();
  }
}
