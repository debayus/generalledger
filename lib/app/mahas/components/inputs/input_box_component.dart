import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/mahas/my_config.dart';

class InputBoxComponent extends StatelessWidget {
  final String? label;
  final double? marginBottom;
  final String? childText;
  final Widget? children;
  final Widget? childrenSizeBox;
  final GestureTapCallback? onTap;
  final bool alowClear;
  final String? errorMessage;
  final IconData? icon;
  final bool? isRequired;
  final Function()? clearOnTab;

  const InputBoxComponent({
    Key? key,
    this.label,
    this.marginBottom,
    this.childText,
    this.onTap,
    this.children,
    this.childrenSizeBox,
    this.alowClear = false,
    this.clearOnTab,
    this.errorMessage,
    this.isRequired = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: label != null,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: (isRequired == true)
                    ? Row(
                        children: [
                          TextComponent(
                            label ?? '-',
                            muted: true,
                          ),
                          TextComponent(
                            "*",
                            muted: true,
                            color: MyConfig.colorRed,
                          ),
                        ],
                      )
                    : TextComponent(
                        label ?? '-',
                        muted: true,
                      ),
              ),
              Padding(padding: EdgeInsets.all(2)),
            ],
          ),
        ),
        Visibility(
          visible: children == null,
          child: Column(
            children: [
              SizedBox(
                height: 48,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: MyConfig.fontColor.withOpacity(.01),
                    border: errorMessage != null
                        ? Border.all(color: Colors.red.shade700, width: .8)
                        : Border.all(color: MyConfig.fontColor, width: .1),
                  ),
                  padding: childrenSizeBox != null
                      ? null
                      : EdgeInsets.only(left: 10, right: 10),
                  child: childrenSizeBox ??
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: onTap,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextComponent(
                                  childText ?? '',
                                  color: MyConfig.fontColor,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: alowClear,
                            child: Container(
                              width: 20,
                              height: 30,
                              child: InkWell(
                                onTap: clearOnTab,
                                child: Icon(
                                  FontAwesome5.times,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !alowClear && icon != null,
                            child: Container(
                              width: 20,
                              height: 30,
                              child: InkWell(
                                onTap: onTap,
                                child: Icon(
                                  icon,
                                  size: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                ),
              ),
              Visibility(
                visible: errorMessage != null,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 8,
                    left: 12,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextComponent(
                      errorMessage ?? "",
                      color: Colors.red.shade700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: children != null,
          child: Column(
            children: [
              children ?? Container(),
              Visibility(
                visible: errorMessage != null,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 8,
                    left: 12,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextComponent(
                      errorMessage ?? "",
                      color: Colors.red.shade700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.all(marginBottom ?? 10)),
      ],
    );
  }
}
