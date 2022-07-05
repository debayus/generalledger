import 'package:flutter/material.dart';
import 'package:generalledger/app/models/jurnal_model.dart';
import 'package:generalledger/app/mahas/components/pages/list_page_component.dart';

import 'package:get/get.dart';

import '../controllers/transaksi_jurnal_manual_controller.dart';

class TransaksiJurnalManualView
    extends GetView<TransaksiJurnalManualController> {
  @override
  Widget build(BuildContext context) => ListPageComponent<JurnalModel>(
        controller: controller.listCon,
        title: 'Jurnal Umum',
        getTitle: (e) => e.no ?? "-",
      );
}
