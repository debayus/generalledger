import 'package:generalledger/app/models/konsep_akun_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/mahas/components/inputs/input_detail_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';
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
      if (!levelmaxCon.isValid) return false;
      if (!digitmaxCon.isValid) return false;
      return true;
    };
    formCon.setModelApi = (id) => {
          'levelmax': int.parse(levelmaxCon.value),
          'digitmax': int.parse(digitmaxCon.value),
          'detail': detailCon.values
              .map((e) => ({
                    'level': e.level,
                    'jumlahdigit': e.jumlahdigit,
                  }))
              .toList(),
        };
    formCon.setModelView = (jsonString) {
      KonsepAkunModel model = KonsepAkunModel.fromDynamic(jsonString);
      levelmaxCon.value = "${model.levelmax}";
      digitmaxCon.value = "${model.digitmax}";
      detailCon.values = model.detail ?? [];
    };

    // detail form
    detailCon.lookupCon.openNew = () {
      detailCon.lookupCon.activeKey = null;
      detailLevelCon.value =
          "${detailCon.values.isEmpty ? 1 : (detailCon.values.last.level! + 1)}";
      detailJumlahDigitCon.value = '';
    };
    detailCon.lookupCon.openEdit = (et) {
      var e = et as KonsepAkunDetailModel;
      detailCon.lookupCon.activeKey = e.level;
      detailLevelCon.value = "${e.level}";
      detailJumlahDigitCon.value = "${e.jumlahdigit}";
    };
    detailCon.lookupCon.insertOnPress = () {
      if (!detailLevelCon.isValid || !detailJumlahDigitCon.isValid) {
        return;
      }
      detailCon.setState!(() {
        if (detailCon.lookupCon.activeKey == null) {
          detailCon.values.add(KonsepAkunDetailModel(
            level: int.parse(detailLevelCon.value),
            jumlahdigit: int.parse(detailJumlahDigitCon.value),
            isNew: true,
          ));
        } else {
          int index = detailCon.values
              .indexWhere((e) => e.level == detailCon.lookupCon.activeKey);
          detailCon.values[index].level = int.parse(detailLevelCon.value);
          detailCon.values[index].jumlahdigit =
              int.parse(detailJumlahDigitCon.value);
        }
      });
      detailCon.lookupCon.close();
    };

    super.onInit();
  }
}
