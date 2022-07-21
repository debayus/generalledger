import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/components/others/text_component.dart';
import 'package:generalledger/app/mahas/my_config.dart';

class ImageTextHorizontalComponent extends StatefulWidget {
  final Function()? ontap;
  final String? urlImage;
  final String? menuName;
  final bool? imageMenu;
  final IconData? iconData;
  final double? iconSize;
  final Color? iconColor;
  final bool? showUnderline;
  final bool? showTextRight;
  final String? textRight;
  final Color? textColor;

  ImageTextHorizontalComponent(
      {@required this.ontap,
      this.urlImage = "",
      @required this.menuName,
      this.imageMenu = false,
      this.showUnderline = true,
      this.showTextRight = false,
      this.textRight = "",
      this.iconData,
      this.iconSize = 15,
      this.iconColor = MyConfig.colorBlack,
      this.textColor = MyConfig.fontColor});

  @override
  ImageTextHorizontalComponentState createState() =>
      ImageTextHorizontalComponentState();
}

class ImageTextHorizontalComponentState
    extends State<ImageTextHorizontalComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: widget.ontap,
              child: Container(
                padding:
                    EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          (widget.imageMenu == false)
                              ? Icon(
                                  widget.iconData,
                                  color: widget.iconColor!,
                                  size: widget.iconSize,
                                )
                              : CircleAvatar(
                                  radius: 15,
                                  child: ClipOval(
                                    child: Image(
                                      image: AssetImage(widget.urlImage!),
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: TextComponent(
                              widget.menuName!,
                              color: widget.textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                        visible: widget.showTextRight!,
                        child: TextComponent(
                          widget.textRight!,
                          color: widget.textColor,
                        ))
                  ],
                ),
              )),
          Visibility(
            visible: widget.showUnderline!,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              color: Colors.grey[200],
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
