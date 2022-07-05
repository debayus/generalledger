import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_box_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';

class RadioButtonItem {
  dynamic id;
  String text;
  dynamic value;

  RadioButtonItem({
    this.id,
    required this.text,
    this.value,
  });
}

class InputRadioController {
  List<RadioButtonItem> items = [];
  RadioButtonItem? value;
  Function(VoidCallback fn)? setState;
  Function(RadioButtonItem v)? onChanged;
  bool required = false;
  String? errorMessage;

  InputRadioController({
    this.required = false,
  });

  void _onChanged(RadioButtonItem v, bool editable) {
    if (!editable) return;
    setState!(() {
      value = v;
      if (onChanged != null) {
        onChanged!(v);
      }
    });
  }

  void init(Function(VoidCallback fn) setStateX) {
    setState = setStateX;
  }

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
}

class InputRadioComponent extends StatefulWidget {
  final InputRadioController controller;
  final bool editable;
  final String? label;

  const InputRadioComponent({
    Key? key,
    required this.controller,
    this.editable = true,
    this.label,
  }) : super(key: key);

  @override
  State<InputRadioComponent> createState() => _InputRadioComponentState();
}

class _InputRadioComponentState extends State<InputRadioComponent> {
  @override
  void initState() {
    widget.controller.init(setState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => InputBoxComponent(
        label: widget.label,
        errorMessage: widget.controller.errorMessage,
        children: Column(
          children: widget.controller.items
              .map((e) => InkWell(
                    onTap: () =>
                        widget.controller._onChanged(e, widget.editable),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio<RadioButtonItem>(
                            value: e,
                            groupValue: widget.controller.value,
                            onChanged: (value) => widget.controller
                                ._onChanged(value!, widget.editable),
                          ),
                          Padding(padding: EdgeInsets.only(left: 5)),
                          TextComponent(
                            e.text,
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      );
}
