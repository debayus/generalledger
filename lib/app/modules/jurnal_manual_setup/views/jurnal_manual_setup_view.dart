import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jurnal_manual_setup_controller.dart';

class JurnalManualSetupView extends GetView<JurnalManualSetupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JurnalManualSetupView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'JurnalManualSetupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
