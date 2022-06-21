import 'package:flutter/material.dart';
import 'package:generalledger/app/models/jurnal_model.dart';
import 'package:generalledger/app/utils/components/pages/list_page_component.dart';

import 'package:get/get.dart';

import '../controllers/jurnal_manual_controller.dart';

class JurnalManualView extends GetView<JurnalManualController> {
  @override
  Widget build(BuildContext context) => ListPageComponent<JurnalModel>(
        controller: controller.listCon,
        title: 'Jurnal',
        getTitle: (e) => e.no ?? "-",
      );
}
