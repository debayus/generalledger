import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_changeemail_controller.dart';

class SettingsChangeemailView extends GetView<SettingsChangeemailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsChangeemailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsChangeemailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
