import 'package:generalledger/app/models/konsep_akun_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/mahas/components/pages/list_page_component.dart';
import 'package:get/get.dart';

class SettingsMasterDataKonsepAkunController extends GetxController {
  final listCon = ListPageController<KonsepAkunModel>(
    urlApi: (pageIndex, filter) =>
        '/api/konsepAkun?page=$pageIndex&filter=$filter',
    fromDynamic: (e) => KonsepAkunModel.fromDynamic(e),
    getId: (e) => {
      'id': (e).id.toString(),
    },
    page: Routes.SETTINGS_MASTER_DATA_KONSEP_AKUN_SETUP,
    pageBack: Routes.SETTINGS_MASTER_DATA,
    allowAdd: false,
    allowSearch: false,
  );
}
