import 'package:generalledger/app/models/proyek_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/components/inputs/input_text_component.dart';
import 'package:generalledger/app/utils/components/pages/setup_page_component.dart';
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
    formCon.isValid = () {
      if (!namaCon.key.currentState!.validate()) return false;
      return true;
    };
    formCon.setModelApi = (id) => {
          'nama': namaCon.con.text,
        };
    formCon.setModelView = (jsonString) {
      ProyekModel model = ProyekModel.fromDynamic(jsonString);
      namaCon.con.text = model.nama!;
    };

    super.onInit();
  }

  @override
  void onClose() {
    namaCon.dispose();
  }
}