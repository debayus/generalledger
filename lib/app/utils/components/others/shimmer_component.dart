import 'package:generalledger/app/utils/components/others/divider_component.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:generalledger/app/utils/my_config.dart';

class ShimmerComponent extends StatelessWidget {
  const ShimmerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyConfig.primaryColor.shade300.withOpacity(0.5),
      highlightColor: MyConfig.primaryColor.shade700.withOpacity(0.5),
      child: Column(
        children: [
          DividerComponent(),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
            width: double.infinity,
            height: 14,
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 0, bottom: 10),
            width: double.infinity,
            height: 14,
            color: Colors.white,
          ),
          DividerComponent(),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
            width: double.infinity,
            height: 14,
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 0, bottom: 10),
            width: double.infinity,
            height: 14,
            color: Colors.white,
          ),
          DividerComponent(),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
            width: double.infinity,
            height: 14,
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, top: 0, bottom: 10),
            width: double.infinity,
            height: 14,
            color: Colors.white,
          ),
          DividerComponent(),
        ],
      ),
    );
  }
}
