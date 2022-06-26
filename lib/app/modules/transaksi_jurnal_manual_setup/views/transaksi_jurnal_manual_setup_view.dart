import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transaksi_jurnal_manual_setup_controller.dart';

class TransaksiJurnalManualSetupView
    extends GetView<TransaksiJurnalManualSetupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransaksiJurnalManualSetupView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TransaksiJurnalManualSetupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
