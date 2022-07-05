import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_box_component.dart';
import 'package:generalledger/app/mahas/components/inputs/lookup_component.dart';
import 'package:generalledger/app/mahas/icons/font_awesome5_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class InputLookupController<T> {
  T? value;
  bool required = false;
  String? errorMessage;
  String? label;
  LookupController<T> lookupCon = LookupController<T>(
    multiple: false,
  );

  InputLookupController({
    this.required = false,
  });

  Function(VoidCallback fn)? setState;
  Function(bool v)? onChanged;
  BuildContext? context;

  bool isValid() {
    setState!(() {
      errorMessage = null;
    });
    if (required && value == null) {
      setState!(() {
        errorMessage = 'The field is required';
      });
      return false;
    }
    return true;
  }

  void onTab(bool editable) async {
    if (!editable) return;
    lookupCon.itemsSelected.clear();

    FocusScope.of(context!).unfocus();
    await showMaterialModalBottomSheet(
      context: context!,
      builder: (context) => LookupComponent<T>(
        controller: lookupCon,
        title: label,
        setItemLabel: lookupCon.setItemLabel,
      ),
    );
  }

  void init(
    Function(VoidCallback fn) setStateX,
    BuildContext contextX,
    String? labelX,
  ) {
    setState = setStateX;
    context = contextX;
    label = labelX;
    lookupCon.insertFromListOnPress = () {
      setState!(() {
        value = lookupCon.itemsSelected.isNotEmpty
            ? lookupCon.itemsSelected.elementAt(0)
            : null;
      });
      lookupCon.close();
    };
  }

  void clearOnTab() {
    setState!(() {
      value = null;
    });
  }
}

enum InputLookupType {
  date,
  time,
}

class InputLookupComponent<T> extends StatefulWidget {
  final String? label;
  final bool editable;
  final double? marginBottom;
  final InputLookupController controller;
  final Function(T?) setText;
  final bool required;

  const InputLookupComponent(
      {Key? key,
      this.label,
      this.marginBottom,
      required this.controller,
      this.editable = true,
      required this.setText,
      this.required = false})
      : super(key: key);

  @override
  State<InputLookupComponent<T>> createState() =>
      _InputLookupComponentState<T>();
}

class _InputLookupComponentState<T> extends State<InputLookupComponent<T>> {
  @override
  void initState() {
    widget.controller.init(setState, context, widget.label);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputBoxComponent(
      label: widget.label,
      isRequired: widget.required,
      alowClear: widget.editable && widget.controller.value != null,
      errorMessage: widget.controller.errorMessage,
      clearOnTab: widget.controller.clearOnTab,
      marginBottom: widget.marginBottom,
      onTap: () => widget.controller.onTab(widget.editable),
      icon: FontAwesome5.search,
      childText: widget.setText(widget.controller.value),
    );
  }
}
