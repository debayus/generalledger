import 'package:flutter/material.dart';
import 'package:generalledger/app/models/akun_model.dart';
import 'package:generalledger/app/utils/components/pages/list_page_component.dart';

import 'package:get/get.dart';

import '../controllers/akun_controller.dart';

class AkunView extends GetView<AkunController> {
  @override
  Widget build(BuildContext context) => ListPageComponent<AkunModel>(
        controller: controller.listCon,
        title: 'Akun',
        getTitle: (e) => "${e.no} - ${e.nama}",
      );
}
