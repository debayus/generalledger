import 'package:generalledger/app/models/jurnal_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/components/pages/list_page_component.dart';
import 'package:get/get.dart';

class JurnalManualController extends GetxController {
  final listCon = ListPageController<JurnalModel>(
    urlApi: (pageIndex, filter) => '/api/jurnal?page=$pageIndex&filter=$filter',
    fromDynamic: (e) => JurnalModel.fromDynamic(e),
    getId: (e) => {
      'id': (e).id.toString(),
    },
    page: Routes.SETTINGS_MASTER_DATA_PROYEK_SETUP,
    pageBack: Routes.SETTINGS_MASTER_DATA,
  );
}
