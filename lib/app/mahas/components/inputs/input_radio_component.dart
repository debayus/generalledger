import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_box_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/services/helper.dart';

class RadioButtonItem {
  dynamic id;
  String text;
  dynamic value;

  RadioButtonItem({
    this.id,
    required this.text,
    this.value,
  });

  RadioButtonItem.autoId(String text, dynamic value)
      : this(
          id: Helper.idGenerator,
          text: text,
          value: value,
        );

  RadioButtonItem.simple(String value) : this.autoId(value, value);
}

class InputRadioController {
  late Function(VoidCallback fn) setState;

  List<RadioButtonItem> items;
  RadioButtonItem? _value;
  Function(RadioButtonItem v)? onChanged;
  bool required = false;
  String? _errorMessage;

  InputRadioController({
    required this.items,
  });

  void _onChanged(RadioButtonItem v, bool editable) {
    if (!editable) return;
    setState(() {
      _value = v;
      if (onChanged != null) {
        onChanged!(v);
      }
    });
  }

  dynamic get value {
    return _value?.value;
  }

  set value(dynamic val) {
    setState(() {
      _value = items.firstWhere((e) => e.value == val);
    });
  }

  void init(Function(VoidCallback fn) setStateX) {
    setState = setStateX;
  }

  bool get isValid {
    setState(() {
      _errorMessage = null;
    });
    if (required && _value == null) {
      setState(() {
        _errorMessage = 'The field is required';
      });
      return false;
    }
    return true;
  }
}

class InputRadioComponent extends StatefulWidget {
  final InputRadioController controller;
  final bool editable;
  final bool required;
  final String? label;

  const InputRadioComponent({
    Key? key,
    required this.controller,
    this.editable = true,
    this.label,
    this.required = false,
  }) : super(key: key);

  @override
  State<InputRadioComponent> createState() => _InputRadioComponentState();
}

class _InputRadioComponentState extends State<InputRadioComponent> {
  @override
  void initState() {
    widget.controller.init(setState);
    widget.controller.required = widget.required;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => InputBoxComponent(
        label: widget.label,
        errorMessage: widget.controller._errorMessage,
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
                            groupValue: widget.controller._value,
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
