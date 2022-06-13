import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transaksi_pengeluaran_tunai_controller.dart';

class TransaksiPengeluaranTunaiView
    extends GetView<TransaksiPengeluaranTunaiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransaksiPengeluaranTunaiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TransaksiPengeluaranTunaiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
