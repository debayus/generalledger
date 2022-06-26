import 'dart:convert';

class AkunModel {
  int? id;
  int? idPerusahaan;
  String? komponen;
  int? idStrukturAkun;
  int? idStrukturAkunDetail;
  String? normalpos;
  int? level;
  String? no;
  String? nama;
  String? idPerusahaanNama;
  String? idStrukturAkunNama;
  String? idStrukturAkunDetailNama;

  // forDetail
  double? debit;
  double? kredit;
  String? catatan;

  static fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static fromDynamic(dynamic dynamicData) {
    final model = AkunModel();
    model.id = dynamicData['id'];
    model.idPerusahaan = dynamicData['id_perusahaan'];
    model.komponen = dynamicData['komponen'];
    model.idStrukturAkun = dynamicData['id_struktur_akun'];
    model.idStrukturAkunDetail = dynamicData['id_struktur_akun_detail'];
    model.normalpos = dynamicData['normalpos'];
    model.level = dynamicData['level'];
    model.no = dynamicData['no'];
    model.nama = dynamicData['nama'];
    model.idPerusahaanNama = dynamicData['id_perusahaan_nama'];
    model.idStrukturAkunNama = dynamicData['id_struktur_akun_nama'];
    model.idStrukturAkunDetailNama =
        dynamicData['id_struktur_akun_detail_nama'];
    return model;
  }
}
