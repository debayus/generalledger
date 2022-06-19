import 'dart:convert';

class StrukturAkunModel {
  int? id;
  String? nama;
  String? jenis;
  String? keterangan;
  List<StrukturAkunDetailModel>? detail;

  static fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static fromDynamic(dynamic dynamicData) {
    final model = StrukturAkunModel();
    model.id = dynamicData['id'];
    model.nama = dynamicData['nama'];
    model.jenis = dynamicData['jenis'];
    model.keterangan = dynamicData['keterangan'];
    if (dynamicData['detail'] != null) {
      final detailT = dynamicData['detail'] as List;
      model.detail = [];
      for (var i = 0; i < detailT.length; i++) {
        model.detail!.add(StrukturAkunDetailModel.fromDynamic(detailT[i]));
      }
    }
    return model;
  }
}

class StrukturAkunDetailModel {
  bool? isNew;
  int? id;
  int? idStrukturAkun;
  String? nama;
  bool? cash;
  bool? bank;

  StrukturAkunDetailModel({
    this.isNew,
    this.id,
    this.nama,
    this.cash,
    this.bank,
  });

  static fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static fromDynamic(dynamic dynamicData) {
    final model = StrukturAkunDetailModel();
    model.id = dynamicData['id'];
    model.idStrukturAkun = dynamicData['id_struktur_akun'];
    model.nama = dynamicData['nama'];
    model.cash = dynamicData['cash'] == 1;
    model.bank = dynamicData['bank'] == 1;
    return model;
  }
}
