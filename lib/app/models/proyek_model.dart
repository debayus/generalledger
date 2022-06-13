import 'dart:convert';

class ProyekModel {
  int? id;
  String? nama;

  static fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static fromDynamic(dynamic dynamicData) {
    final model = ProyekModel();
    model.id = dynamicData['id'];
    model.nama = dynamicData['nama'];
    return model;
  }
}
