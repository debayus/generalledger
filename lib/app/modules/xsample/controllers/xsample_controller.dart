import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:get/get.dart';

class XsampleController extends GetxController {
  void inputOnPress() {
    Helper.toNamed(Routes.XSAMPLE_INPUT);
  }

  void checkboxRadioOnPress() {
    Helper.toNamed(Routes.XSAMPLE_CHECKBOX_RADIO);
  }

  void dateTimeOnPress() {
    Helper.toNamed(Routes.XSAMPLE_DATE_TIME);
  }
}
