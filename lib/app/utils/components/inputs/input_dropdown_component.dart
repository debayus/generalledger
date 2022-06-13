import 'package:flutter/material.dart';
import 'package:generalledger/app/utils/components/inputs/input_box_component.dart';
import 'package:generalledger/app/utils/my_config.dart';

class InputDropdownController<T> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String? text;
  T? value;
  List<T> items = [];
  Function(VoidCallback fn)? setState;
  ValueChanged<T?>? onChanged;
  bool required = false;

  InputDropdownController({this.required = false, this.items = const []});

  void rootOnChanged(e) {
    setState!(() {
      value = e;
      if (onChanged != null) {
        onChanged!(e);
      }
    });
  }

  String? validator(v) {
    if (required && v == null) {
      return 'The field is required';
    }
    return null;
  }

  bool isValid() {
    bool? valid = key.currentState?.validate();
    if (valid == null) {
      return true;
    }
    return valid;
  }

  void init(Function(VoidCallback fn)? setStateX, bool requiredX) {
    setState = setStateX;
    required = requiredX;
  }
}

class InputDropdownComponent<T> extends StatefulWidget {
  final String? label;
  final double? marginBottom;
  final bool required;
  final bool editable;
  final InputDropdownController<T> controller;
  final String Function(T?) itemLabel;

  const InputDropdownComponent({
    Key? key,
    this.label,
    this.marginBottom,
    this.editable = true,
    required this.controller,
    this.required = false,
    required this.itemLabel,
  }) : super(key: key);

  @override
  State<InputDropdownComponent<T>> createState() =>
      _InputDropdownComponentState<T>();
}

class _InputDropdownComponentState<T> extends State<InputDropdownComponent<T>> {
  @override
  void initState() {
    widget.controller.init(
      setState,
      widget.required,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      filled: true,
      contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 10, right: 10),
      fillColor: MyConfig.fontColor.withOpacity(.05),
      isDense: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyConfig.fontColor.withOpacity(.05)),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyConfig.fontColor.withOpacity(.05)),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      prefixStyle: TextStyle(
        color: Colors.white.withOpacity(0.6),
      ),
      suffixIconConstraints: BoxConstraints(
        minHeight: 30,
        minWidth: 30,
      ),
    );

    return InputBoxComponent(
      label: widget.label,
      isRequired: widget.required,
      marginBottom: widget.marginBottom,
      childText: widget.controller.value == null
          ? ""
          : widget.itemLabel(widget.controller.value),
      children: widget.editable
          ? Form(
              key: widget.controller.key,
              child: DropdownButtonFormField<T>(
                decoration: decoration,
                isExpanded: true,
                focusColor: Colors.transparent,
                validator: widget.controller.validator,
                value: widget.controller.value,
                onChanged: widget.controller.rootOnChanged,
                items: widget.controller.items
                    .map((e) => DropdownMenuItem<T>(
                          value: e,
                          child: Text(widget.itemLabel(e)),
                        ))
                    .toList(),
                style: TextStyle(
                  color: MyConfig.fontColor.withOpacity(.7),
                  fontSize: MyConfigTextSize.normal,
                ),
                dropdownColor: MyConfig.primaryColorRevenge,
              ),
            )
          : null,
    );
  }
}
