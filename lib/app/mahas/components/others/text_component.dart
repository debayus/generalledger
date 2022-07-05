import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/my_config.dart';

enum TextSize {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  normal,
}

class TextComponent extends StatelessWidget {
  final String data;
  final Color? color;
  final TextSize size;
  final bool muted;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const TextComponent(
    this.data, {
    Key? key,
    this.color,
    this.size = TextSize.normal,
    this.muted = false,
    this.textAlign,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size == TextSize.h1
            ? MyConfigTextSize.h1
            : size == TextSize.h2
                ? MyConfigTextSize.h2
                : size == TextSize.h3
                    ? MyConfigTextSize.h3
                    : size == TextSize.h4
                        ? MyConfigTextSize.h4
                        : size == TextSize.h5
                            ? MyConfigTextSize.h5
                            : size == TextSize.h6
                                ? MyConfigTextSize.h6
                                : MyConfigTextSize.normal,
        color: (color ?? MyConfig.fontColor).withOpacity(muted ? .5 : 1),
        fontWeight: fontWeight,
      ),
    );
  }
}
