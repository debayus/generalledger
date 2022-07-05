import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/my_config.dart';

class DividerComponent extends StatelessWidget {
  const DividerComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: MyConfig.primaryColor.shade700.withOpacity(0.5),
    );
  }
}
