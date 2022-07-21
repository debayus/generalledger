import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:get/get.dart';

class XsampleInputController extends GetxController {
  var editable = true.obs;

  final inputTextCon = InputTextController();
  final inputEmailCon = InputTextController();
  final inputNumberCon = InputTextController();
  final inputMoneyCon = InputTextController();
  final inputParagrafCon = InputTextController();
  final inputPasswordCon = InputTextController();

  void changeEditableOnPress() {
    editable.value = !editable.value;
    editable.refresh();
  }

  void validateOnPress() {
    inputTextCon.isValid;
    inputEmailCon.isValid;
    inputNumberCon.isValid;
    inputMoneyCon.isValid;
    inputParagrafCon.isValid;
    inputPasswordCon.isValid;
  }

  void setValueOnPress() {
    inputTextCon.value = "Test";
    inputEmailCon.value = "test@test.test";
    inputNumberCon.value = 123456;
    inputMoneyCon.value = 100000;
    inputParagrafCon.value = "Test\nTest";
    inputPasswordCon.value = "123456";
  }

  void getValueOnPress() {
    var val = '''
${inputTextCon.value}
${inputEmailCon.value}
${inputNumberCon.value}
${inputMoneyCon.value}
${inputParagrafCon.value}
${inputPasswordCon.value}
''';
    Helper.dialogShow(val);
  }
}
