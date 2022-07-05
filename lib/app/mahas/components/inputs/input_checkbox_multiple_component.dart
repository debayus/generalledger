import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_box_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';

class CheckboxMultipleItem {
  dynamic id;
  String text;
  bool checked;

  CheckboxMultipleItem({
    this.id,
    required this.text,
    this.checked = false,
  });
}

class InputCheckboxMultipleController {
  List<CheckboxMultipleItem> items = [];
  Function(VoidCallback fn)? setState;
  Function(CheckboxMultipleItem v)? onChanged;

  void _onChanged(CheckboxMultipleItem v, bool editable) {
    if (!editable) return;
    setState!(() {
      v.checked = !v.checked;
      if (onChanged != null) {
        onChanged!(v);
      }
    });
  }

  void init(Function(VoidCallback fn) setStateX) {
    setState = setStateX;
  }

  bool isValid() {
    return true;
  }
}

class InputCheckboxMultipleComponent extends StatefulWidget {
  final InputCheckboxMultipleController controller;
  final bool editable;
  final String? label;

  const InputCheckboxMultipleComponent({
    Key? key,
    required this.controller,
    this.editable = true,
    this.label,
  }) : super(key: key);

  @override
  State<InputCheckboxMultipleComponent> createState() =>
      _InputCheckboxMultipleComponentState();
}

class _InputCheckboxMultipleComponentState
    extends State<InputCheckboxMultipleComponent> {
  @override
  void initState() {
    widget.controller.init(setState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => InputBoxComponent(
        label: widget.label,
        children: Column(
          children: widget.controller.items
              .map((e) => InkWell(
                    onTap: () =>
                        widget.controller._onChanged(e, widget.editable),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: e.checked,
                            onChanged: (v) => widget.controller
                                ._onChanged(e, widget.editable),
                          ),
                          Padding(padding: EdgeInsets.only(left: 5)),
                          InkWell(
                            child: TextComponent(
                              e.text,
                            ),
                            onTap: () => widget.controller
                                ._onChanged(e, widget.editable),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      );
}
