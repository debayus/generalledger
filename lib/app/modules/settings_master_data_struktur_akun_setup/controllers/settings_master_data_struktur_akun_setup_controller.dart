import 'package:generalledger/app/models/struktur_akun_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/mahas/components/inputs/input_checkbox_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_detail_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_dropdown_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';
import 'package:get/get.dart';

class SettingsMasterDataStrukturAkunSetupController extends GetxController {
  final formCon = SetupPageController(
    urlApiGet: (id) => '/api/strukturAkun/$id',
    urlApiPost: () => '/api/strukturAkun/',
    urlApiPut: (id) => '/api/strukturAkun/$id',
    urlApiDelete: (id) => '/api/strukturAkun/$id',
    pageBack: Routes.SETTINGS_MASTER_DATA_STRUKTUR_AKUN,
    setKey: (e) => e['id'],
    getIdPost: (e) => e['id'],
  );
  final namaCon = InputTextController();
  final jenisCon = InputDropdownController<String>(
    items: [
      "Neraca",
      "Laba - Rugi",
    ],
  );
  final keteranganCon = InputTextController();
  final detailCon =
      InputDetailControler<StrukturAkunDetailModel, StrukturAkunDetailModel>(
    setKeyItem: (e) => e.id,
  );

  // input detail
  final detailNamaCon = InputTextController();
  final detailCashCon = InputCheckboxController();
  final detailBankCon = InputCheckboxController();

  @override
  void onInit() {
    formCon.isValid = () {
      if (!jenisCon.isValid) return false;
      if (!namaCon.isValid) return false;
      return true;
    };
    formCon.setModelApi = (id) => {
          'nama': namaCon.value,
          'jenis': jenisCon.value,
          'keterangan': keteranganCon.value,
          'detail': detailCon.values
              .map((e) => ({
                    'nama': e.nama,
                    'cash': e.cash,
                    'bank': e.bank,
                    'id': e.isNew == true ? null : e.id,
                  }))
              .toList(),
        };
    formCon.setModelView = (jsonString) {
      StrukturAkunModel model = StrukturAkunModel.fromDynamic(jsonString);
      namaCon.value = model.nama!;
      keteranganCon.value = model.keterangan ?? "";
      jenisCon.value = model.jenis!;
      detailCon.values = model.detail ?? [];
    };

    // detail form
    detailCon.lookupCon.openNew = () {
      detailCon.lookupCon.activeKey = null;
      detailNamaCon.value = '';
      detailCashCon.checked = false;
      detailBankCon.checked = false;
    };
    detailCon.lookupCon.openEdit = (et) {
      var e = et as StrukturAkunDetailModel;
      detailCon.lookupCon.activeKey = e.id;
      detailNamaCon.value = e.nama!;
      detailCashCon.checked = e.cash ?? false;
      detailBankCon.checked = e.bank ?? false;
    };
    detailCon.lookupCon.insertOnPress = () {
      if (!detailNamaCon.key.currentState!.validate()) {
        return;
      }
      detailCon.setState!(() {
        if (detailCon.lookupCon.activeKey == null) {
          int id = detailCon.values.isNotEmpty
              ? detailCon.values[detailCon.values.length - 1].id!
              : 0;
          detailCon.values.add(StrukturAkunDetailModel(
            id: id + 100,
            nama: detailNamaCon.value,
            cash: detailCashCon.checked,
            bank: detailBankCon.checked,
            isNew: true,
          ));
        } else {
          int index = detailCon.values
              .indexWhere((e) => e.id == detailCon.lookupCon.activeKey);
          detailCon.values[index].nama = detailNamaCon.value;
          detailCon.values[index].cash = detailCashCon.checked;
          detailCon.values[index].bank = detailBankCon.checked;
        }
      });
      detailCon.lookupCon.close();
    };

    super.onInit();
  }

  @override
  void onClose() {
    namaCon.dispose();
  }
}
