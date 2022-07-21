import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_box_component.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/services/helper.dart';

class CheckboxMultipleItem {
  dynamic id;
  String text;
  bool checked;

  CheckboxMultipleItem({
    this.id,
    required this.text,
    this.checked = false,
  });

  CheckboxMultipleItem.autoId(String text, bool checked)
      : this(
          id: Helper.idGenerator,
          text: text,
          checked: checked,
        );

  CheckboxMultipleItem.simple(String text)
      : this(
          id: Helper.idGenerator,
          text: text,
          checked: false,
        );
}

class InputCheckboxMultipleController {
  List<CheckboxMultipleItem> items;
  late Function(VoidCallback fn) setState;
  Function(CheckboxMultipleItem v)? onChanged;

  InputCheckboxMultipleController({
    required this.items,
  });

  void _onChanged(CheckboxMultipleItem v, bool editable) {
    if (!editable) return;
    setState(() {
      v.checked = !v.checked;
      if (onChanged != null) {
        onChanged!(v);
      }
    });
  }

  void refresh() {
    setState(() {});
  }

  void _init(Function(VoidCallback fn) setStateX) {
    setState = setStateX;
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
    widget.controller._init(setState);
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
