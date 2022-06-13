import 'dart:convert';

class KontakModel {
  int? id;
  String? nama;
  String? telp;
  String? whatsapp;
  String? email;
  String? perusahaan;
  String? alamat;
  String? catatan;

  static fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static fromDynamic(dynamic dynamicData) {
    final model = KontakModel();
    model.id = dynamicData['id'];
    model.nama = dynamicData['nama'];
    model.telp = dynamicData['telp'];
    model.whatsapp = dynamicData['whatsapp'];
    model.email = dynamicData['email'];
    model.perusahaan = dynamicData['perusahaan'];
    model.alamat = dynamicData['alamat'];
    model.catatan = dynamicData['catatan'];
    return model;
  }
}
