import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_account_controller.dart';

class SettingsAccountView extends GetView<SettingsAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsAccountView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsAccountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
