import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_deleteaccount_controller.dart';

class SettingsDeleteaccountView
    extends GetView<SettingsDeleteaccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsDeleteaccountView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsDeleteaccountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
