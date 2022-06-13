import 'package:generalledger/app/models/struktur_akun_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/components/pages/list_page_component.dart';
import 'package:get/get.dart';

class SettingsMasterDataStrukturAkunController extends GetxController {
  final listCon = ListPageController<StrukturAkunModel>(
    urlApi: (pageIndex, filter) =>
        '/api/strukturAkun?page=$pageIndex&filter=$filter',
    fromDynamic: (e) => StrukturAkunModel.fromDynamic(e),
    getId: (e) => {
      'id': (e).id.toString(),
    },
    page: Routes.SETTINGS_MASTER_DATA_STRUKTUR_AKUN_SETUP,
    pageBack: Routes.SETTINGS_MASTER_DATA,
  );
}
