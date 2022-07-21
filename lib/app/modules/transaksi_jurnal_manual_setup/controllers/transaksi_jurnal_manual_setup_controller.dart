import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:generalledger/app/models/akun_model.dart';
import 'package:generalledger/app/models/jurnal_model.dart';
import 'package:generalledger/app/models/proyek_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/mahas/components/inputs/input_datetime_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_detail_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_dropdown_component.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';
import 'package:generalledger/app/mahas/services/helper.dart';
import 'package:generalledger/app/mahas/services/http_api.dart';
import 'package:get/get.dart';

class TransaksiJurnalManualSetupController extends GetxController {
  final formCon = SetupPageController(
    urlApiGet: (id) => '/api/jurnal/$id',
    urlApiPost: () => '/api/jurnal/',
    urlApiPut: (id) => '/api/jurnal/$id',
    urlApiDelete: (id) => '/api/jurnal/$id',
    pageBack: Routes.TRANSAKSI_JURNAL_MANUAL,
    setKey: (e) => e['id'],
    getIdPost: (e) => e['id'],
  );
  final noCon = InputTextController();
  final tanggalCon = InputDatetimeController();
  final catatanCon = InputTextController();
  final idProyekCon = InputDropdownController<ProyekModel>();

  final detailCon = InputDetailControler<JurnalDetailModel, AkunModel>(
    setKeyItem: (e) => e.idAkun,
  );

  // input detail
  final detailDebitCon = InputTextController();
  final detailKreditCon = InputTextController();
  final detailCatatanCon = InputTextController();

  // master
  final masterProyek = <ProyekModel>[];

  @override
  void onInit() {
    formCon.isValid = () {
      if (!noCon.isValid) return false;
      if (!tanggalCon.isValid) return false;
      if (!catatanCon.isValid) return false;
      if (!idProyekCon.isValid) return false;
      return true;
    };
    formCon.setModelApi = (id) => {
          'no': noCon.value,
          'tanggal': Helper.dateToString(tanggalCon.date),
          'catatan': catatanCon.value,
          'idProyek': idProyekCon.value?.id,
          'debit': 0,
          'kredit': 0,
          'detail': detailCon.values
              .map((e) => ({
                    'id_akun': e.idAkun,
                    'debit': e.debit,
                    'kredit': e.kredit,
                    'catatan': e.catatan,
                  }))
              .toList(),
        };
    formCon.setModelView = (jsonString) {
      JurnalModel model = JurnalModel.fromDynamic(jsonString);

      // final noCon = InputTextController();
      // final tanggalCon = InputTextController();
      // final catatanCon = InputTextController();
      // final idPreyekCon = InputTextController();

      // namaCon.con.text = model.nama!;
      // telpCon.con.text = model.telp ?? "";
      // whatsappCon.con.text = model.whatsapp ?? "";
      // emailCon.con.text = model.email ?? "";
      // perusahaanCon.con.text = model.perusahaan ?? "";
      // alamatCon.con.text = model.alamat ?? "";
      catatanCon.value = model.catatan ?? "";
    };

    // detail lookup
    detailCon.lookupCon.urlApi = (pageIndex, filter) =>
        '/api/jurnalLookUpAkun?page=$pageIndex&filter=$filter';
    detailCon.lookupCon.fromDynamic = (e) => AkunModel.fromDynamic(e);
    detailCon.lookupCon.setItemLabel =
        (e) => "${(e as AkunModel).no} - ${e.nama}";
    detailCon.lookupCon.setKeyItem = (e) => (e as AkunModel).id;
    detailCon.lookupCon.withSetup = true;

    // detail form
    detailCon.lookupCon.openNew = () {
      detailCon.lookupCon.activeKey = null;
      detailDebitCon.value = '';
      detailDebitCon.value = null;
      detailKreditCon.value = '';
      detailKreditCon.value = null;
    };
    detailCon.lookupCon.openEdit = (et) {
      var e = et as JurnalDetailModel;
      detailCon.lookupCon.activeKey = e.idAkun;
      detailDebitCon.value = e.debit;
      detailDebitCon.value = Helper.currencyFormat(e.debit ?? 0);
      detailKreditCon.value = e.kredit;
      detailKreditCon.value = Helper.currencyFormat(e.kredit ?? 0);
    };
    detailCon.lookupCon.insertOnPress = () {
      if (!detailDebitCon.isValid || !detailKreditCon.isValid) {
        return;
      }
      if (detailCon.lookupCon.itemsSelectedActive == null) {
        int index = detailCon.values
            .indexWhere((e) => e.idAkun == detailCon.lookupCon.activeKey);
        if (index >= 0) {
          detailCon.setState!(() {
            detailCon.values[index].debit = detailDebitCon.value;
            detailCon.values[index].kredit = detailKreditCon.value;
          });
        }
        detailCon.lookupCon.close();
      } else {
        if (detailCon.lookupCon.itemsSelectedActive != null) {
          detailCon.lookupCon.itemsSelectedActive!.debit = detailDebitCon.value;
          detailCon.lookupCon.itemsSelectedActive!.kredit =
              detailKreditCon.value;
          detailCon.lookupCon.itemsSelected
              .add(detailCon.lookupCon.itemsSelectedActive!);
        }
        detailCon.lookupCon.setState!(() {
          detailCon.lookupCon.isSetup = false;
        });
      }
    };
    detailCon.lookupCon.insertFromListOnPress = () {
      detailCon.setState!(() {
        var items = detailCon.lookupCon.itemsSelected;
        for (var i = 0; i < items.length; i++) {
          int index =
              detailCon.values.indexWhere((e) => e.idAkun == items[i].id);
          if (index < 0) {
            var newItem = JurnalDetailModel();
            newItem.idAkun = items[i].id;
            newItem.no = items[i].no;
            newItem.nama = items[i].nama;
            newItem.debit = items[i].debit;
            newItem.kredit = items[i].kredit;
            newItem.catatan = items[i].catatan;
            detailCon.values.add(newItem);
          }
        }
      });
      detailCon.lookupCon.close();
    };

    formCon.initState = () async {
      await EasyLoading.show();
      final r = await HttpApi.apiGet('/api/jurnalMaster');
      await EasyLoading.dismiss();
      if (r.success) {
        masterProyek.clear();
        var proyek = r.body['proyek'];
        for (var i = 0; i < proyek.length; i++) {
          masterProyek.add(ProyekModel.fromDynamic(proyek[i]));
        }
      } else {
        Helper.dialogWarning(r.message);
        return;
      }
      idProyekCon.items = masterProyek;
      noCon.value = 'Auto';
      if (masterProyek.isNotEmpty) {
        idProyekCon.value = idProyekCon.items.first;
      }
      tanggalCon.date = DateTime.now();
    };

    super.onInit();
  }
}
