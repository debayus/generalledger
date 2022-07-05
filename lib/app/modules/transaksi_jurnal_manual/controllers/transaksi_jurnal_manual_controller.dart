import 'package:generalledger/app/models/jurnal_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/mahas/components/pages/list_page_component.dart';
import 'package:get/get.dart';

class TransaksiJurnalManualController extends GetxController {
  final listCon = ListPageController<JurnalModel>(
    urlApi: (pageIndex, filter) => '/api/jurnal?page=$pageIndex&filter=$filter',
    fromDynamic: (e) => JurnalModel.fromDynamic(e),
    getId: (e) => {
      'id': (e).id.toString(),
    },
    page: Routes.TRANSAKSI_JURNAL_MANUAL_SETUP,
    pageBack: Routes.TRANSAKSI,
  );
}
