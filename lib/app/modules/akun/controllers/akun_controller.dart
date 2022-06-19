import 'package:generalledger/app/models/akun_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/components/pages/list_page_component.dart';
import 'package:get/get.dart';

class AkunController extends GetxController {
  final listCon = ListPageController<AkunModel>(
    urlApi: (pageIndex, filter) => '/api/akun?page=$pageIndex&filter=$filter',
    fromDynamic: (e) => AkunModel.fromDynamic(e),
    getId: (e) => {
      'id': (e).id.toString(),
    },
    page: Routes.AKUN_SETUP,
    pageBack: Routes.HOME,
  );
}
