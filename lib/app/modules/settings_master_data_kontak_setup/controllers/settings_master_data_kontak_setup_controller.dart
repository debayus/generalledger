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
          'nama': namaCon.value,
          'telp': telpCon.value,
          'whatsapp': whatsappCon.value,
          'email': emailCon.value,
          'perusahaan': perusahaanCon.value,
          'alamat': alamatCon.value,
          'catatan': catatanCon.value,
        };
    formCon.setModelView = (jsonString) {
      KontakModel model = KontakModel.fromDynamic(jsonString);
      namaCon.value = model.nama!;
      telpCon.value = model.telp;
      whatsappCon.value = model.whatsapp;
      emailCon.value = model.email;
      perusahaanCon.value = model.perusahaan;
      alamatCon.value = model.alamat;
      catatanCon.value = model.catatan;
    };

    super.onInit();
  }

  @override
  void onClose() {
    namaCon.dispose();
  }
}
