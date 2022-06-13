import 'package:flutter/material.dart';
import 'package:generalledger/app/utils/components/others/text_component.dart';
import 'package:generalledger/app/utils/my_config.dart';

class ButtonComponent extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final double? marginBottom;
  final Radius? borderRadius;
  final IconData? icon;
  final Widget? child;
  final Color? color;
  final Color? textColor;

  const ButtonComponent({
    Key? key,
    this.label,
    this.marginBottom,
    this.borderRadius,
    this.icon,
    this.color,
    this.textColor,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom ?? 0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child ??
            (icon == null
                ? TextComponent(
                    label ?? "",
                    color: textColor ?? MyConfig.primaryColorRevenge,
                    fontWeight: FontWeight.w600,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon!,
                        size: 16,
                        color: textColor ?? MyConfig.primaryColorRevenge,
                      ),
                      Container(width: 10),
                      TextComponent(
                        label ?? "",
                        color: textColor ?? MyConfig.primaryColorRevenge,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  )),
        style: ElevatedButton.styleFrom(
          primary: color ?? MyConfig.primaryColor,
          minimumSize: const Size.fromHeight(44),
          shape: borderRadius != null
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(borderRadius!),
                )
              : null,
        ),
      ),
    );
  }
}
