import 'package:generalledger/app/mahas/components/inputs/input_dropdown_component.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:get/get.dart';

class XsampleDropDownController extends GetxController {
  var editable = true.obs;

  final dropdownCon = InputDropdownController(
    items: [
      DropdownItem.simple("Option 1"),
      DropdownItem.simple("Option 2"),
      DropdownItem.simple("Option 3"),
    ],
  );

  void changeEditableOnPress() {
    editable.value = !editable.value;
    editable.refresh();
  }

  void validateOnPress() {
    dropdownCon.isValid;
  }

  void setValueOnPress() {
    dropdownCon.value = "Option 2";
  }

  void getValueOnPress() {
    var val = '''
${dropdownCon.value}
''';
    Helper.dialogShow(val);
  }
}
