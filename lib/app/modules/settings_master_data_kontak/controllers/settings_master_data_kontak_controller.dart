import 'package:generalledger/app/models/kontak_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/mahas/components/pages/list_page_component.dart';
import 'package:get/get.dart';

class SettingsMasterDataKontakController extends GetxController {
  final listCon = ListPageController<KontakModel>(
    urlApi: (pageIndex, filter) => '/api/kontak?page=$pageIndex&filter=$filter',
    fromDynamic: (e) => KontakModel.fromDynamic(e),
    getId: (e) => {
      'id': (e).id.toString(),
    },
    page: Routes.SETTINGS_MASTER_DATA_KONTAK_SETUP,
    pageBack: Routes.SETTINGS_MASTER_DATA,
  );
}
