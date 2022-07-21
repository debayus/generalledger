import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_box_component.dart';
import 'package:generalledger/app/mahas/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/mahas/my_config.dart';
import 'package:generalledger/app/mahas/services/helper.dart';

class InputDatetimeController {
  late bool _required;
  late InputDatetimeType _type;
  late BuildContext _context;
  late Function(VoidCallback fn) setState;

  DateTime? _date;
  TimeOfDay? _time;
  String? _errorMessage;

  Function(bool v)? onChanged;

  set value(dynamic val) {
    setState(() {
      if (_type == InputDatetimeType.date) {
        _date = val;
      } else {
        _time = val;
      }
    });
  }

  dynamic get value {
    if (_type == InputDatetimeType.date) {
      return _date;
    } else {
      return _time;
    }
  }

  bool get isValid {
    setState(() {
      _errorMessage = null;
    });

    if (_required &&
        ((_type == InputDatetimeType.date && _date == null) ||
            (_type == InputDatetimeType.time && _time == null))) {
      setState(() {
        _errorMessage = 'The field is required';
      });
      return false;
    }
    return true;
  }

  void _onTab(bool editable) async {
    if (!editable) return;
    if (_type == InputDatetimeType.date) {
      final DateTime? picked = await showDatePicker(
        context: _context,
        initialDate: _date ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(3000),
      );
      if (picked != null && _date != picked) {
        setState(() {
          _date = picked;
        });
      }
    } else {
      final TimeOfDay? picked = await showTimePicker(
        context: _context,
        initialTime: _time ?? TimeOfDay.now(),
      );
      if (picked != null && _time != picked) {
        setState(() {
          _time = picked;
        });
      }
    }
  }

  void _init(
    Function(VoidCallback fn) setStateX,
    BuildContext contextX,
    bool requiredX,
    InputDatetimeType typeX,
  ) {
    setState = setStateX;
    _context = contextX;
    _required = requiredX;
    _type = typeX;
  }

  void _clearOnTab() {
    setState(() {
      _date = null;
      _time = null;
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
  final InputDatetimeType type;

  const InputDatetimeComponent({
    Key? key,
    this.label,
    this.marginBottom,
    required this.controller,
    this.editable = true,
    this.required = false,
    this.type = InputDatetimeType.date,
  }) : super(key: key);

  @override
  State<InputDatetimeComponent> createState() => _InputDatetimeComponentState();
}

class _InputDatetimeComponentState extends State<InputDatetimeComponent> {
  @override
  void initState() {
    widget.controller._init(setState, context, widget.required, widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputBoxComponent(
      label: widget.label,
      editable: widget.editable,
      isRequired: widget.required,
      icon: widget.controller._type == InputDatetimeType.date
          ? FontAwesome5.calendar
          : FontAwesome5.clock,
      alowClear: widget.editable &&
          ((widget.controller._type == InputDatetimeType.date &&
                  widget.controller._date != null) ||
              (widget.controller._type == InputDatetimeType.time &&
                  widget.controller._time != null)),
      errorMessage: widget.controller._errorMessage,
      clearOnTab: widget.controller._clearOnTab,
      marginBottom: widget.marginBottom,
      onTap: () => widget.controller._onTab(widget.editable),
      childText: widget.controller._type == InputDatetimeType.date
          ? Helper.dateToString(widget.controller._date,
              format: MyConfig.dateFormat)
          : widget.controller._time?.format(context) ?? '',
    );
  }
}
