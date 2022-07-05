import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_box_component.dart';
import 'package:generalledger/app/mahas/my_config.dart';
import 'package:generalledger/app/mahas/services/helper.dart';

class InputTextController extends ChangeNotifier {
  bool required = false;
  InputTextType type = InputTextType.text;
  bool showPassword = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController con = TextEditingController();
  String? value;
  Function(VoidCallback fn)? setState;
  VoidCallback? onEditingComplete;
  ValueChanged<String>? onChanged;
  GestureTapCallback? onTap;
  ValueChanged<String>? onFieldSubmitted;
  FormFieldSetter<String>? onSaved;
  bool? visibility;
  double? moneyValue;

  InputTextController({
    this.required = false,
  });

  String? validator(String? v, {FormFieldValidator<String>? otherValidator}) {
    if (required && (v?.isEmpty ?? false)) {
      return 'The field is required';
    }
    if (type == InputTextType.email) {
      final pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      final regex = RegExp(pattern);
      if ((v?.isEmpty ?? false) || !regex.hasMatch(v!)) {
        return 'Enter a valid email address';
      } else {
        return null;
      }
    }
    if (otherValidator != null) {
      return otherValidator(v);
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

  void onFocusChange(bool? stateFocus) {
    if (stateFocus ?? false) {
      con.text = moneyValue == 0 ? "" : "${moneyValue ?? ""}";
    } else {
      moneyValue = double.tryParse(con.text);
      con.text = Helper.currencyFormat(moneyValue ?? 0);
    }
  }

  void setVisible(bool value) {
    setState!(() {
      visibility = value;
    });
  }

  bool getVisible() {
    return visibility == null ? false : visibility!;
  }

  void init(Function(VoidCallback fn)? setStateX) {
    setState = setStateX;
  }

  @override
  void dispose() {
    con.dispose();
    super.dispose();
  }
}

enum InputTextType { text, email, password, number, paragraf, money }

class InputTextComponent extends StatefulWidget {
  final InputTextController controller;
  final bool required;
  final String? label;
  final bool editable;
  final InputTextType type;
  final String? placeHolder;
  final double? marginBottom;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final String? prefixText;
  final Radius? borderRadius;
  final bool? visibility;

  const InputTextComponent({
    Key? key,
    required this.controller,
    this.required = false,
    this.label,
    this.editable = true,
    this.type = InputTextType.text,
    this.placeHolder,
    this.marginBottom,
    this.inputFormatters,
    this.validator,
    this.prefixText,
    this.borderRadius,
    this.visibility = true,
  }) : super(key: key);

  @override
  State<InputTextComponent> createState() => _InputTextComponentState();
}

class _InputTextComponentState extends State<InputTextComponent> {
  @override
  void initState() {
    widget.controller.init(setState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.required = widget.required;
    widget.controller.type = widget.type;
    widget.controller.visibility = widget.visibility;

    final decoration = InputDecoration(
      filled: true,
      fillColor: MyConfig.fontColor.withOpacity(.05),
      hintText: widget.placeHolder,
      isDense: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyConfig.fontColor.withOpacity(.05)),
        borderRadius:
            BorderRadius.all(widget.borderRadius ?? Radius.circular(4.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyConfig.fontColor.withOpacity(.05)),
        borderRadius:
            BorderRadius.all(widget.borderRadius ?? Radius.circular(4.0)),
      ),
      prefixText: widget.prefixText,
      prefixStyle: TextStyle(
        color: MyConfig.fontColor.withOpacity(0.6),
      ),
      suffixIconConstraints: BoxConstraints(
        minHeight: 30,
        minWidth: 30,
      ),
      suffixIcon: widget.type == InputTextType.password
          ? InkWell(
              splashColor: Colors.transparent,
              onTap: () => setState(() {
                widget.controller.showPassword =
                    !widget.controller.showPassword;
              }),
              child: Icon(
                widget.controller.showPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: MyConfig.fontColor.withOpacity(0.6),
                size: 14,
              ),
            )
          : null,
    );

    var textFormField = TextFormField(
      maxLines: widget.type == InputTextType.paragraf ? 4 : 1,
      onChanged: widget.controller.onChanged,
      onSaved: widget.controller.onSaved,
      onTap: widget.controller.onTap,
      onFieldSubmitted: widget.controller.onFieldSubmitted,
      style: TextStyle(
        color: MyConfig.fontColor,
        fontSize: MyConfigTextSize.normal,
      ),
      inputFormatters: (widget.type == InputTextType.number ||
              widget.type == InputTextType.money)
          ? [
              FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,10}')),
              ...(widget.inputFormatters ?? []),
            ]
          : null,
      controller: widget.controller.con,
      validator: (v) =>
          widget.controller.validator(v, otherValidator: widget.validator),
      autocorrect: false,
      enableSuggestions: false,
      readOnly: !widget.editable,
      obscureText: widget.type == InputTextType.password
          ? !widget.controller.showPassword
          : false,
      onEditingComplete: widget.controller.onEditingComplete,
      keyboardType: (widget.type == InputTextType.number ||
              widget.type == InputTextType.money)
          ? TextInputType.number
          : null,
      decoration: decoration,
    );

    return Visibility(
      visible: widget.visibility!,
      child: InputBoxComponent(
        label: widget.label,
        marginBottom: widget.marginBottom,
        childText: widget.controller.con.text,
        isRequired: widget.required,
        children: Form(
          key: widget.controller.key,
          child: widget.type == InputTextType.money
              ? Focus(
                  child: textFormField,
                  onFocusChange: widget.controller.onFocusChange,
                )
              : textFormField,
        ),
      ),
    );
  }
}
