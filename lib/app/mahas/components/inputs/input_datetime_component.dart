import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_box_component.dart';
import 'package:generalledger/app/mahas/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/mahas/services/helper.dart';

class InputDatetimeController {
  DateTime? date;
  TimeOfDay? time;
  bool required = false;
  InputDatetimeType type = InputDatetimeType.date;
  String? errorMessage;

  InputDatetimeController({
    this.required = false,
    this.type = InputDatetimeType.date,
  });

  Function(VoidCallback fn)? setState;
  BuildContext? context;
  Function(bool v)? onChanged;

  bool get isValid {
    setState!(() {
      errorMessage = null;
    });

    if (required &&
        ((type == InputDatetimeType.date && date == null) ||
            (type == InputDatetimeType.time && time == null))) {
      setState!(() {
        errorMessage = 'The field is required';
      });
      return false;
    }
    return true;
  }

  void onTab(bool editable) async {
    if (!editable) return;
    if (type == InputDatetimeType.date) {
      final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: date ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(3000),
      );
      if (picked != null && date != picked) {
        setState!(() {
          date = picked;
        });
      }
    } else {
      final TimeOfDay? picked = await showTimePicker(
        context: context!,
        initialTime: time ?? TimeOfDay.now(),
      );
      if (picked != null && time != picked) {
        setState!(() {
          time = picked;
        });
      }
    }
  }

  void init(
    Function(VoidCallback fn) setStateX,
    BuildContext contextX,
    bool requiredX,
  ) {
    setState = setStateX;
    context = contextX;
    required = requiredX;
  }

  void clearOnTab() {
    setState!(() {
      date = null;
      time = null;
    });
  }
}

enum InputDatetimeType {
  date,
  time,
}

class InputDatetimeComponent extends StatefulWidget {
  final String? label;
  final bool editable;
  final double? marginBottom;
  final bool required;
  final InputDatetimeController controller;

  const InputDatetimeComponent({
    Key? key,
    this.label,
    this.marginBottom,
    required this.controller,
    this.editable = true,
    this.required = false,
  }) : super(key: key);

  @override
  State<InputDatetimeComponent> createState() => _InputDatetimeComponentState();
}

class _InputDatetimeComponentState extends State<InputDatetimeComponent> {
  @override
  void initState() {
    widget.controller.init(setState, context, widget.required);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputBoxComponent(
      label: widget.label,
      isRequired: widget.required,
      icon: widget.controller.type == InputDatetimeType.date
          ? FontAwesome5.calendar
          : FontAwesome5.clock,
      alowClear: widget.editable &&
          ((widget.controller.type == InputDatetimeType.date &&
                  widget.controller.date != null) ||
              (widget.controller.type == InputDatetimeType.time &&
                  widget.controller.time != null)),
      errorMessage: widget.controller.errorMessage,
      clearOnTab: widget.controller.clearOnTab,
      marginBottom: widget.marginBottom,
      onTap: () => widget.controller.onTab(widget.editable),
      childText: widget.controller.type == InputDatetimeType.date
          ? Helper.dateToString(widget.controller.date, format: 'dd-MM-yyyy')
          : widget.controller.time?.format(context) ?? '',
    );
  }
}
