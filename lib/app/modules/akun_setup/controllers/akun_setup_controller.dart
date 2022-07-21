import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:generalledger/app/mahas/components/inputs/input_dropdown_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:generalledger/app/models/akun_model.dart';
import 'package:generalledger/app/models/konsep_akun_model.dart';
import 'package:generalledger/app/models/struktur_akun_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/mahas/services/http_api.dart';
import 'package:get/get.dart';

class AkunSetupController extends GetxController {
  final formCon = SetupPageController(
    urlApiGet: (id) => '/api/akun/$id',
    urlApiPost: () => '/api/akun/',
    urlApiPut: (id) => '/api/akun/$id',
    urlApiDelete: (id) => '/api/akun/$id',
    pageBack: Routes.AKUN,
    setKey: (e) => e['id'],
    getIdPost: (e) => e['id'],
  );

  // model
  final komponenCon = InputDropdownController<String>(
    items: [
      "Neraca",
      "Laba - Rugi",
    ],
  );
  final groupCon = InputDropdownController<StrukturAkunModel>();
  final subGroupCon = InputDropdownController<StrukturAkunDetailModel>();
  final normalPosCon = InputDropdownController<String>(
    items: [
      "Debit",
      "Kredit",
    ],
  );
  final levelCon = InputDropdownController<int>();
  final noCon = InputTextController();
  final namaCon = InputTextController();

  // master
  final masterGroup = <StrukturAkunModel>[];
  final masterSubGroup = <StrukturAkunDetailModel>[];
  final masterLevel = <KonsepAkunDetailModel>[];

  @override
  void onInit() {
    formCon.isValid = () {
      if (!komponenCon.key.currentState!.validate()) return false;
      if (!groupCon.key.currentState!.validate()) return false;
      if (!subGroupCon.key.currentState!.validate()) return false;
      if (!normalPosCon.key.currentState!.validate()) return false;
      if (!levelCon.key.currentState!.validate()) return false;
      if (!noCon.key.currentState!.validate()) return false;
      if (!namaCon.key.currentState!.validate()) return false;
      return true;
    };
    formCon.setModelApi = (id) => {
          'komponen': komponenCon.value,
          'id_struktur_akun': groupCon.value?.id,
          'id_struktur_akun_detail': subGroupCon.value?.id,
          'normalpos': normalPosCon.value,
          'level': levelCon.value,
          'no': noCon.value,
          'nama': namaCon.value,
        };
    formCon.setModelView = (jsonString) {
      AkunModel model = AkunModel.fromDynamic(jsonString);
      komponenCon.value = model.komponen;
      groupCon.value =
          masterGroup.firstWhereOrNull((e) => e.id == model.idStrukturAkun);
      subGroupCon.value = masterSubGroup
          .firstWhereOrNull((e) => e.id == model.idStrukturAkunDetail);
      normalPosCon.value = model.normalpos;
      levelCon.value = model.level;
      noCon.value = model.no;
      namaCon.value = model.nama;

      groupCon.items =
          masterGroup.where((e) => e.jenis == model.komponen).toList();
      subGroupCon.items = masterSubGroup
          .where((e) => e.idStrukturAkun == model.idStrukturAkun)
          .toList();
    };

    formCon.initState = () async {
      await EasyLoading.show();
      final r = await HttpApi.apiGet('/api/akunMaster');
      await EasyLoading.dismiss();
      if (r.success) {
        masterGroup.clear();
        masterSubGroup.clear();
        masterLevel.clear();
        var strukturAkun = r.body['strukturAkun'];
        var strukturAkunDetail = r.body['strukturAkunDetail'];
        var konsepAkunDetail = r.body['konsepAkunDetail'];
        for (var i = 0; i < strukturAkun.length; i++) {
          masterGroup.add(StrukturAkunModel.fromDynamic(strukturAkun[i]));
        }
        for (var i = 0; i < strukturAkunDetail.length; i++) {
          masterSubGroup
              .add(StrukturAkunDetailModel.fromDynamic(strukturAkunDetail[i]));
        }
        for (var i = 0; i < konsepAkunDetail.length; i++) {
          masterLevel
              .add(KonsepAkunDetailModel.fromDynamic(konsepAkunDetail[i]));
        }
      } else {
        Helper.dialogWarning(r.message);
        return;
      }

      komponenCon.onChanged = (m) {
        groupCon.setState!(() {
          var list = masterGroup.where((e) => e.jenis == m).toList();
          groupCon.value = list.firstWhereOrNull((e) => e == groupCon.value);
          groupCon.items = list;
        });
      };

      groupCon.onChanged = (m) {
        subGroupCon.setState!(() {
          var list =
              masterSubGroup.where((e) => e.idStrukturAkun == m?.id).toList();
          subGroupCon.value =
              list.firstWhereOrNull((e) => e == subGroupCon.value);
          subGroupCon.items = m == null ? [] : list;
        });
      };

      levelCon.items = masterLevel.map((e) => e.level ?? 0).toList();

      var akunHeaderId = Get.parameters['akunHeader'];
      if (akunHeaderId != null) {
        await EasyLoading.show();
        final r = await HttpApi.apiGet('/api/akunNew/$akunHeaderId');
        await EasyLoading.dismiss();
        if (r.success) {
          AkunModel model = AkunModel.fromDynamic(r.body['akun']);
          AkunModel? child = r.body['child'] == null
              ? null
              : AkunModel.fromDynamic(r.body['child']);
          KonsepAkunDetailModel? konsepAkun = r.body['konsepAkun'] == null
              ? null
              : KonsepAkunDetailModel.fromDynamic(r.body['konsepAkun']);

          // process new number
          var newNo = child == null
              ? 0
              : int.parse(child.no?.substring(model.no?.length ?? 0) ?? "0");
          newNo += 1;
          var strNewNo =
              '${model.no}${Helper.intToString(newNo, (konsepAkun?.jumlahdigit ?? 0) - (model.no?.length ?? 0), '0')}';

          // set view
          komponenCon.value = model.komponen;
          groupCon.value =
              masterGroup.firstWhereOrNull((e) => e.id == model.idStrukturAkun);
          subGroupCon.value = masterSubGroup
              .firstWhereOrNull((e) => e.id == model.idStrukturAkunDetail);
          normalPosCon.value = model.normalpos;
          levelCon.value = model.level! + 1;
          namaCon.value = "";
          noCon.value = strNewNo;
          groupCon.items =
              masterGroup.where((e) => e.jenis == model.komponen).toList();
          subGroupCon.items = masterSubGroup
              .where((e) => e.idStrukturAkun == model.idStrukturAkun)
              .toList();
        } else {
          Helper.dialogWarning(r.message);
        }
      }
    };

    super.onInit();
  }

  @override
  void onClose() {
    namaCon.dispose();
  }
}
