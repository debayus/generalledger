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
  final komponenCon = InputDropdownController(
    items: [
      DropdownItem.simple("Neraca"),
      DropdownItem.simple("Laba - Rugi"),
    ],
  );
  final groupCon = InputDropdownController();
  final subGroupCon = InputDropdownController();
  final normalPosCon = InputDropdownController(
    items: [
      DropdownItem.simple("Debit"),
      DropdownItem.simple("Kredit"),
    ],
  );
  final levelCon = InputDropdownController();
  final noCon = InputTextController();
  final namaCon = InputTextController();

  // master
  final masterGroup = <StrukturAkunModel>[];
  final masterSubGroup = <StrukturAkunDetailModel>[];
  final masterLevel = <KonsepAkunDetailModel>[];

  @override
  void onInit() {
    formCon.isValid = () {
      if (!komponenCon.isValid) return false;
      if (!groupCon.isValid) return false;
      if (!subGroupCon.isValid) return false;
      if (!normalPosCon.isValid) return false;
      if (!levelCon.isValid) return false;
      if (!noCon.isValid) return false;
      if (!namaCon.isValid) return false;
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

      groupCon.setItems = masterGroup
          .where((e) => e.jenis == model.komponen)
          .map((e) => DropdownItem.init(e.nama ?? "", e.id))
          .toList();
      subGroupCon.setItems = masterSubGroup
          .where((e) => e.idStrukturAkun == model.idStrukturAkun)
          .map((e) => DropdownItem.init(e.nama ?? "", e.id))
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
        groupCon.setState(() {
          var list = masterGroup
              .where((e) => e.jenis == m?.value)
              .map((e) => DropdownItem.init(e.nama ?? "", e.id))
              .toList();
          groupCon.setItems = list;
          groupCon.value = m?.value;
        });
      };

      groupCon.onChanged = (m) {
        subGroupCon.setState(() {
          var list = masterSubGroup
              .where((e) => e.idStrukturAkun == m?.value)
              .map((e) => DropdownItem.init(e.nama ?? "", e.id))
              .toList();
          subGroupCon.value = subGroupCon.value;
          subGroupCon.setItems = m == null ? [] : list;
        });
      };

      levelCon.setItems = masterLevel
          .map((e) => e.level ?? 0)
          .map((e) => DropdownItem.init("$e", e))
          .toList();

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
          groupCon.setItems = masterGroup
              .where((e) => e.jenis == model.komponen)
              .map((e) => DropdownItem.init(e.nama, e.id))
              .toList();
          subGroupCon.setItems = masterSubGroup
              .where((e) => e.idStrukturAkun == model.idStrukturAkun)
              .map((e) => DropdownItem.init(e.nama, e.id))
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
