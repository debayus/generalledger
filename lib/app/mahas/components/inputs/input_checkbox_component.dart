import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';

class InputCheckboxController {
  bool _checked = false;
  late Function(VoidCallback fn) setState;
  Function(bool v)? onChanged;

  void onTab(bool editable) {
    if (!editable) return;
    setState(() {
      _checked = !_checked;
      if (onChanged != null) {
        onChanged!(_checked);
      }
    });
  }

  bool get checked {
    return _checked;
  }

  set checked(bool val) {
    setState(() {
      _checked = val;
    });
  }

  void _onChanged(bool? v, bool editable) {
    if (!editable) return;
    setState(() {
      _checked = v ?? false;
      if (onChanged != null) {
        onChanged!(_checked);
      }
    });
  }

  void _init(Function(VoidCallback fn) setStateX) {
    setState = setStateX;
  }
}

class InputCheckboxComponent extends StatefulWidget {
  final InputCheckboxController controller;
  final bool editable;
  final String? label;
  final bool isSwitch;

  const InputCheckboxComponent({
    Key? key,
    required this.controller,
    this.editable = true,
    this.label,
    this.isSwitch = false,
  }) : super(key: key);

  @override
  State<InputCheckboxComponent> createState() => _InputCheckboxComponentState();
}

class _InputCheckboxComponentState extends State<InputCheckboxComponent> {
  @override
  void initState() {
    widget.controller._init(setState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (widget.isSwitch
              ? Switch(
                  value: widget.controller._checked,
                  onChanged: (v) =>
                      widget.controller._onChanged(v, widget.editable),
                )
              : Checkbox(
                  value: widget.controller._checked,
                  onChanged: (v) =>
                      widget.controller._onChanged(v, widget.editable),
                )),
          Padding(padding: EdgeInsets.only(left: 5)),
          InkWell(
            child: TextComponent(
              widget.label ?? "",
            ),
            onTap: () => widget.controller.onTab(widget.editable),
          ),
        ],
      ),
    );
  }
}
