import 'package:generalledger/app/mahas/components/inputs/input_checkbox_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_radio_component.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:get/get.dart';

class XsampleCheckboxRadioController extends GetxController {
  var editable = true.obs;

  final checkboxCon = InputCheckboxController();
  final switchCon = InputCheckboxController();
  final radioCon = InputRadioController(items: [
    RadioButtonItem.simple("Radio 1"),
    RadioButtonItem.simple("Radio 2"),
  ]);

  void changeEditableOnPress() {
    editable.value = !editable.value;
    editable.refresh();
  }

  void validateOnPress() {
    radioCon.isValid;
  }

  void setValueOnPress() {
    checkboxCon.checked = true;
    switchCon.checked = true;
    radioCon.value = 'Radio 2';
  }

  void getValueOnPress() {
    var val = '''
${checkboxCon.checked}
${switchCon.checked}
${radioCon.value}
''';
    Helper.dialogShow(val);
  }
}
