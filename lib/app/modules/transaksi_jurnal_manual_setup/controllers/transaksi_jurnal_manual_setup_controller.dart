import 'package:generalledger/app/models/jurnal_model.dart';
import 'package:generalledger/app/routes/app_pages.dart';
import 'package:generalledger/app/utils/components/inputs/input_text_component.dart';
import 'package:generalledger/app/utils/components/pages/setup_page_component.dart';
import 'package:get/get.dart';

class TransaksiJurnalManualSetupController extends GetxController {
  final formCon = SetupPageController(
    urlApiGet: (id) => '/api/jurnal/$id',
    urlApiPost: () => '/api/jurnal/',
    urlApiPut: (id) => '/api/jurnal/$id',
    urlApiDelete: (id) => '/api/jurnal/$id',
    pageBack: Routes.TRANSAKSI_JURNAL_MANUAL_SETUP,
    setKey: (e) => e['id'],
    getIdPost: (e) => e['id'],
  );
  final noCon = InputTextController();
  final tanggalCon = InputTextController();
  final catatanCon = InputTextController();
  final idProyekCon = InputTextController();

  @override
  void onInit() {
    formCon.isValid = () {
      if (!noCon.key.currentState!.validate()) return false;
      if (!tanggalCon.key.currentState!.validate()) return false;
      if (!catatanCon.key.currentState!.validate()) return false;
      if (!idProyekCon.key.currentState!.validate()) return false;
      return true;
    };
    formCon.setModelApi = (id) => {
          'no': noCon.con.text,
          'tanggal': tanggalCon.con.text,
          'catatan': catatanCon.con.text,
          'idProyek': idProyekCon.con.text,
          'debit': 0,
          'kredit': 0,
        };
    formCon.setModelView = (jsonString) {
      JurnalModel model = JurnalModel.fromDynamic(jsonString);

      final noCon = InputTextController();
      final tanggalCon = InputTextController();
      final catatanCon = InputTextController();
      final idPreyekCon = InputTextController();

      // namaCon.con.text = model.nama!;
      // telpCon.con.text = model.telp ?? "";
      // whatsappCon.con.text = model.whatsapp ?? "";
      // emailCon.con.text = model.email ?? "";
      // perusahaanCon.con.text = model.perusahaan ?? "";
      // alamatCon.con.text = model.alamat ?? "";
      catatanCon.con.text = model.catatan ?? "";
    };

    super.onInit();
  }
}
