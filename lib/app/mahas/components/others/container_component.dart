import 'package:flutter/material.dart';

class ContainerComponent extends StatelessWidget {
  final Widget? child;
  final Decoration? decoration;
  final double? marginTop;
  final Color? color;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;

  const ContainerComponent({
    Key? key,
    this.child,
    this.decoration,
    this.marginTop,
    this.marginBottom,
    this.marginLeft,
    this.marginRight,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: decoration,
      color: color,
      padding: EdgeInsets.only(
        top: marginTop ?? 15,
        left: marginLeft ?? 15,
        right: marginLeft ?? 15,
        bottom: marginBottom ?? 15,
      ),
    );
  }
}
