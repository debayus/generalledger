import 'package:get/get.dart';

import '../controllers/xsample_drop_down_controller.dart';

class XsampleDropDownBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<XsampleDropDownController>(
      () => XsampleDropDownController(),
    );
  }
}
