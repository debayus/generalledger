import 'package:generalledger/app/models/kontak_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';
import 'package:get/get.dart';

class SettingsMasterDataKontakSetupController extends GetxController {
  final formCon = SetupPageController(
    urlApiGet: (id) => '/api/kontak/$id',
    urlApiPost: () => '/api/kontak/',
    urlApiPut: (id) => '/api/kontak/$id',
    urlApiDelete: (id) => '/api/kontak/$id',
    pageBack: Routes.SETTINGS_MASTER_DATA_KONTAK,
    setKey: (e) => e['id'],
    getIdPost: (e) => e['id'],
  );
  final namaCon = InputTextController();
  final telpCon = InputTextController();
  final whatsappCon = InputTextController();
  final emailCon = InputTextController();
  final perusahaanCon = InputTextController();
  final alamatCon = InputTextController();
  final catatanCon = InputTextController();

  @override
  void onInit() {
    formCon.isValid = () {
      if (!namaCon.key.currentState!.validate()) return false;
      return true;
    };
    formCon.setModelApi = (id) => {
          'nama': namaCon.con.text,
          'telp': telpCon.con.text,
          'whatsapp': whatsappCon.con.text,
          'email': emailCon.con.text,
          'perusahaan': perusahaanCon.con.text,
          'alamat': alamatCon.con.text,
          'catatan': catatanCon.con.text,
        };
    formCon.setModelView = (jsonString) {
      KontakModel model = KontakModel.fromDynamic(jsonString);
      namaCon.con.text = model.nama!;
      telpCon.con.text = model.telp ?? "";
      whatsappCon.con.text = model.whatsapp ?? "";
      emailCon.con.text = model.email ?? "";
      perusahaanCon.con.text = model.perusahaan ?? "";
      alamatCon.con.text = model.alamat ?? "";
      catatanCon.con.text = model.catatan ?? "";
    };

    super.onInit();
  }

  @override
  void onClose() {
    namaCon.dispose();
  }
}
