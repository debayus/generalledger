import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:generalledger/app/utils/components/inputs/lookup_component.dart';
import 'package:generalledger/app/utils/components/others/container_component.dart';
import 'package:generalledger/app/utils/components/others/text_component.dart';
import 'package:generalledger/app/utils/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/utils/my_config.dart';

class InputDetailControler<T> {
  final Function(T)? setTitleItem;
  final Function(T)? setKeyItem;
  final Function(dynamic)? fromDynamic;
  final bool allowEdit;
  LookupController<T> lookupCon = LookupController<T>();
  Widget Function(dynamic)? setup;
  BuildContext? context;
  String? label;

  InputDetailControler({
    this.setTitleItem,
    this.setKeyItem,
    this.fromDynamic,
    this.allowEdit = true,
  });

  List<T> values = [];
  Function(VoidCallback fn)? setState;
  Function(dynamic)? itemDeleteOnPress;
  Function(dynamic)? itemEditOnPress;

  void init(
    Function(VoidCallback fn)? setStateX,
    BuildContext contextX,
    Widget Function(dynamic)? setupX,
    String? labelX,
  ) {
    setState = setStateX;
    context = contextX;
    setup = setupX;
    label = labelX;

    itemDeleteOnPress = (e) {
      setState!(() {
        values.removeWhere((element) => setKeyItem!(element) == setKeyItem!(e));
      });
    };
    itemEditOnPress = (e) async {
      FocusScope.of(context!).unfocus();
      lookupCon.openEdit!(e);
      lookupCon.isSetup = true;
      await showMaterialModalBottomSheet(
        context: context!,
        builder: (context) => LookupComponent<T>(
          controller: lookupCon,
          setup: setup,
          title: labelX,
          setItemLabel: lookupCon.setItemLabel,
        ),
      );
    };
  }

  void addOnPressed() async {
    if (EasyLoading.isShow) return;

    if (lookupCon.urlApi == null) {
      lookupCon.isSetup = true;
      lookupCon.openNew!();
    } else {
      lookupCon.itemsSelected.clear();
    }

    FocusScope.of(context!).unfocus();
    await showMaterialModalBottomSheet(
      context: context!,
      builder: (context) => LookupComponent<T>(
        controller: lookupCon,
        setup: setup,
        title: label,
        setItemLabel: lookupCon.setItemLabel,
      ),
    );
  }
}

class InputDetailComponent<T> extends StatefulWidget {
  final InputDetailControler controller;
  final String? label;
  final bool editable;
  final Function(dynamic) builder;
  final Widget Function(dynamic)? setup;

  const InputDetailComponent({
    Key? key,
    this.label,
    this.editable = true,
    required this.controller,
    required this.builder,
    this.setup,
  }) : super(key: key);

  @override
  State<InputDetailComponent> createState() => _InputDetailComponentState();
}

class _InputDetailComponentState extends State<InputDetailComponent> {
  @override
  void initState() {
    widget.controller.init(setState, context, widget.setup, widget.label);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ContainerComponent(
            marginTop: 0,
            marginBottom: 5,
            child: TextComponent(
              widget.label ?? "",
              muted: true,
            ),
          ),
          Container(
            color: MyConfig.greyInputan.withOpacity(.3),
            child: Column(
              children: [
                Visibility(
                  visible: !widget.editable,
                  child: Padding(padding: EdgeInsets.all(2)),
                ),
                Visibility(
                  visible: widget.controller.values.isEmpty && !widget.editable,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.all(5)),
                      Icon(
                        FontAwesome5.box_open,
                        color: MyConfig.greyInputan,
                        size: 30,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      TextComponent(
                        "No Data",
                        color: MyConfig.greyInputan,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: widget.controller.values
                      .map((element) => ContainerComponent(
                            marginTop: 12,
                            marginBottom: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: widget.builder(element) as Widget,
                                    ),
                                    Visibility(
                                      visible: widget.editable,
                                      child: InkWell(
                                        onTap: () => widget.controller
                                            .itemDeleteOnPress!(element),
                                        child: Icon(
                                          Icons.delete_forever,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: widget.editable &&
                                      widget.controller.allowEdit,
                                  child: InkWell(
                                    onTap: () => widget
                                        .controller.itemEditOnPress!(element),
                                    child: TextComponent(
                                      "Edit",
                                      color: Colors.yellow.shade900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
                Visibility(
                  visible: widget.editable,
                  child: Padding(padding: EdgeInsets.all(5)),
                ),
                Visibility(
                  visible: widget.editable,
                  child: TextButton(
                    child: Icon(FontAwesome5.plus_circle),
                    onPressed: widget.controller.addOnPressed,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
