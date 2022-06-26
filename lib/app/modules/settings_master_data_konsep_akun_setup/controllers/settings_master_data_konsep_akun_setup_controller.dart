import 'package:generalledger/app/models/konsep_akun_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/components/inputs/input_detail_component.dart';
import 'package:generalledger/app/utils/components/inputs/input_text_component.dart';
import 'package:generalledger/app/utils/components/pages/setup_page_component.dart';
import 'package:get/get.dart';

class SettingsMasterDataKonsepAkunSetupController extends GetxController {
  final formCon = SetupPageController(
    urlApiGet: (id) => '/api/konsepAkun/$id',
    urlApiPost: () => '/api/konsepAkun/',
    urlApiPut: (id) => '/api/konsepAkun/$id',
    urlApiDelete: (id) => '/api/konsepAkun/$id',
    pageBack: Routes.SETTINGS_MASTER_DATA_KONSEP_AKUN,
    setKey: (e) => e['id'],
    getIdPost: (e) => e['id'],
    allowDelete: false,
  );
  final levelmaxCon = InputTextController();
  final digitmaxCon = InputTextController();
  final detailCon =
      InputDetailControler<KonsepAkunDetailModel, KonsepAkunDetailModel>(
    setKeyItem: (e) => e.level,
  );

  // input detail
  final detailLevelCon = InputTextController();
  final detailJumlahDigitCon = InputTextController();

  @override
  void onInit() {
    formCon.isValid = () {
      if (!levelmaxCon.isValid()) return false;
      if (!digitmaxCon.isValid()) return false;
      return true;
    };
    formCon.setModelApi = (id) => {
          'levelmax': int.parse(levelmaxCon.con.text),
          'digitmax': int.parse(digitmaxCon.con.text),
          'detail': detailCon.values
              .map((e) => ({
                    'level': e.level,
                    'jumlahdigit': e.jumlahdigit,
                  }))
              .toList(),
        };
    formCon.setModelView = (jsonString) {
      KonsepAkunModel model = KonsepAkunModel.fromDynamic(jsonString);
      levelmaxCon.con.text = "${model.levelmax}";
      digitmaxCon.con.text = "${model.digitmax}";
      detailCon.values = model.detail ?? [];
    };

    // detail form
    detailCon.lookupCon.openNew = () {
      detailCon.lookupCon.activeKey = null;
      detailLevelCon.con.text =
          "${detailCon.values.isEmpty ? 1 : (detailCon.values.last.level! + 1)}";
      detailJumlahDigitCon.con.text = '';
    };
    detailCon.lookupCon.openEdit = (et) {
      var e = et as KonsepAkunDetailModel;
      detailCon.lookupCon.activeKey = e.level;
      detailLevelCon.con.text = "${e.level}";
      detailJumlahDigitCon.con.text = "${e.jumlahdigit}";
    };
    detailCon.lookupCon.insertOnPress = () {
      if (!detailLevelCon.isValid() || !detailJumlahDigitCon.isValid()) {
        return;
      }
      detailCon.setState!(() {
        if (detailCon.lookupCon.activeKey == null) {
          detailCon.values.add(KonsepAkunDetailModel(
            level: int.parse(detailLevelCon.con.text),
            jumlahdigit: int.parse(detailJumlahDigitCon.con.text),
            isNew: true,
          ));
        } else {
          int index = detailCon.values
              .indexWhere((e) => e.level == detailCon.lookupCon.activeKey);
          detailCon.values[index].level = int.parse(detailLevelCon.con.text);
          detailCon.values[index].jumlahdigit =
              int.parse(detailJumlahDigitCon.con.text);
        }
      });
      detailCon.lookupCon.close();
    };

    super.onInit();
  }
}
