import 'package:generalledger/app/mahas/components/inputs/input_datetime_component.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:get/get.dart';

class XsampleDateTimeController extends GetxController {
  var editable = true.obs;

  final dateCon = InputDatetimeController();
  final timeCon = InputDatetimeController();

  void changeEditableOnPress() {
    editable.value = !editable.value;
    editable.refresh();
  }

  void validateOnPress() {
    dateCon.isValid;
    timeCon.isValid;
  }

  void setValueOnPress() {
    dateCon.value = Helper.stringToDate('2021-01-01');
    timeCon.value = Helper.stringToTime('11:24');
  }

  void getValueOnPress() {
    var val = '''
${Helper.dateToString(dateCon.value)}
${Helper.timeToString(timeCon.value)}
''';
    Helper.dialogShow(val);
  }
}
