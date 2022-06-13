import 'dart:convert';

class KonsepAkunModel {
  int? id;
  int? levelmax;
  int? digitmax;
  List<KonsepAkunDetailModel>? detail;

  static fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static fromDynamic(dynamic dynamicData) {
    final model = KonsepAkunModel();
    model.id = dynamicData['id'];
    model.levelmax = dynamicData['levelmax'];
    model.digitmax = dynamicData['digitmax'];
    if (dynamicData['detail'] != null) {
      final detailT = dynamicData['detail'] as List;
      model.detail = [];
      for (var i = 0; i < detailT.length; i++) {
        model.detail!.add(KonsepAkunDetailModel.fromDynamic(detailT[i]));
      }
    }
    return model;
  }
}

class KonsepAkunDetailModel {
  bool? isNew;
  int? level;
  int? jumlahdigit;

  KonsepAkunDetailModel({
    this.isNew,
    this.level,
    this.jumlahdigit,
  });

  static fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static fromDynamic(dynamic dynamicData) {
    final model = KonsepAkunDetailModel();
    model.level = dynamicData['level'];
    model.jumlahdigit = dynamicData['jumlahdigit'];
    return model;
  }
}
