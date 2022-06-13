import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laporan_neraca_saldo_controller.dart';

class LaporanNeracaSaldoView extends GetView<LaporanNeracaSaldoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LaporanNeracaSaldoView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LaporanNeracaSaldoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
