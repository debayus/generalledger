import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/icons/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:tree_view/tree_view.dart';
import '../controllers/akun_controller.dart';

class AkunView extends GetView<AkunController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Akun"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                FontAwesome5.plus,
                size: 14,
              ),
              onPressed: controller.addOnTab,
            ),
            Padding(padding: EdgeInsets.all(7))
          ],
        ),
        body: Obx(
          () => TreeView(
            children: controller.list.toList(),
          ),
        ),
      );
}
