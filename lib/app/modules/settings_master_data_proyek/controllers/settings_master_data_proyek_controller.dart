import 'package:generalledger/app/models/proyek_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/components/pages/list_page_component.dart';
import 'package:get/get.dart';

class SettingsMasterDataProyekController extends GetxController {
  final listCon = ListPageController<ProyekModel>(
    urlApi: (pageIndex, filter) => '/api/proyek?page=$pageIndex&filter=$filter',
    fromDynamic: (e) => ProyekModel.fromDynamic(e),
    getId: (e) => {
      'id': (e).id.toString(),
    },
    page: Routes.SETTINGS_MASTER_DATA_PROYEK_SETUP,
    pageBack: Routes.SETTINGS_MASTER_DATA,
  );
}
