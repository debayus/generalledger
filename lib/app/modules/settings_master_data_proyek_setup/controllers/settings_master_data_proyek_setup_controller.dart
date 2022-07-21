import 'package:generalledger/app/models/proyek_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/mahas/components/inputs/input_text_component.dart';
import 'package:generalledger/app/mahas/components/pages/setup_page_component.dart';
import 'package:get/get.dart';

class SettingsMasterDataProyekSetupController extends GetxController {
  final formCon = SetupPageController(
    urlApiGet: (id) => '/api/proyek/$id',
    urlApiPost: () => '/api/proyek/',
    urlApiPut: (id) => '/api/proyek/$id',
    urlApiDelete: (id) => '/api/proyek/$id',
    pageBack: Routes.SETTINGS_MASTER_DATA_PROYEK,
    setKey: (e) => e['id'],
    getIdPost: (e) => e['id'],
  );
  final namaCon = InputTextController();

  @override
  void onInit() {
    super.onInit();

    formCon.isValid = () {
      if (!namaCon.isValid) return false;
      return true;
    };
    formCon.setModelApi = (id) => {
          'nama': namaCon.value,
        };
    formCon.setModelView = (jsonString) {
      ProyekModel model = ProyekModel.fromDynamic(jsonString);
      namaCon.value = model.nama!;
    };
  }

  @override
  void onClose() {
    namaCon.dispose();
  }
}
