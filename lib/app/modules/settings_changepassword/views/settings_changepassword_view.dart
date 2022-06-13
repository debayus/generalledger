import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_changepassword_controller.dart';

class SettingsChangepasswordView
    extends GetView<SettingsChangepasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsChangepasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsChangepasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
