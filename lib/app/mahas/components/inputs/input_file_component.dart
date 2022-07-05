import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/inputs/input_box_component.dart';
import 'package:generalledger/app/mahas/icons/font_awesome5_icons.dart';

class InputFileController {
  List<PlatformFile> files = List<PlatformFile>.empty(growable: true);
  bool isMutipleFile = false;
  bool required = false;
  InputFileType type;
  String? errorMessage;

  InputFileController(
      {this.required = false, required this.type, this.isMutipleFile = false});

  Function(VoidCallback fn)? setState;
  BuildContext? context;
  Function(bool v)? onChanged;

  bool isValid() {
    setState!(() {
      errorMessage = null;
    });
    if (required &&
        ((type == InputFileType.pdf && files.isEmpty) ||
            (type == InputFileType.doc && files.isEmpty) ||
            (type == InputFileType.image && files.isEmpty))) {
      setState!(() {
        errorMessage = 'The field is required';
      });
      return false;
    }
    return true;
  }

  void onTab(bool editable) async {
    if (!editable) return;
    FilePickerResult? result;
    if (isMutipleFile == false) files.clear();
    if (type == InputFileType.pdf) {
      result = await FilePicker.platform.pickFiles(
          allowedExtensions: ['pdf'],
          type: FileType.custom,
          allowCompression: true,
          allowMultiple: isMutipleFile);
      if (result!.files.isNotEmpty) {
        if (result.files[result.files.length - 1].extension != "pdf") {
          return;
        }
      }
    } else if (type == InputFileType.doc) {
      result = await FilePicker.platform.pickFiles(
          allowedExtensions: ['doc', 'docx'], allowMultiple: isMutipleFile);
      if (result!.files.isNotEmpty) {
        if (result.files[result.files.length - 1].extension != "doc" ||
            result.files[result.files.length - 1].extension != "docx") {
          return;
        }
      }
    } else {
      result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: isMutipleFile);
    }
    if (result!.files.isEmpty) return;
    setState!(() {
      files.addAll(result!.files);
    });
  }

  void init(Function(VoidCallback fn) setStateX, BuildContext contextX) {
    setState = setStateX;
    context = contextX;
  }

  void clearOnTab() {
    setState!(() {
      files.clear();
    });
  }
}

enum InputFileType { pdf, doc, image }

class InputFileComponent extends StatefulWidget {
  final InputFileController controller;
  final bool? editable;
  final String? label;
  const InputFileComponent(
      {Key? key,
      required this.controller,
      this.editable = true,
      required this.label})
      : super(key: key);

  @override
  InputFileComponentState createState() => InputFileComponentState();
}

class InputFileComponentState extends State<InputFileComponent> {
  @override
  void initState() {
    widget.controller.init(setState, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputBoxComponent(
      icon: FontAwesome5.search,
      label: widget.label,
      onTap: () => widget.controller.onTab(true),
      childText: (widget.controller.files.isEmpty)
          ? ''
          : widget.controller.files[0].name,
      alowClear: widget.editable! && widget.controller.files.isNotEmpty,
      errorMessage: widget.controller.errorMessage,
      clearOnTab: () => widget.controller.clearOnTab(),
    );
  }
}
