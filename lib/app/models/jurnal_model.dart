import 'dart:convert';

class JurnalModel {
  int? id;
  int? idUserCreate;
  int? idUserUpdate;
  int? idUserTutupbuku;
  int? idUserBatal;
  String? no;
  DateTime? tanggal;
  String? catatan;
  int? idProyek;
  double? debit;
  double? kredit;
  bool? tutupbuku;
  bool? batal;
  String? batalketerangan;
  int? idTutupbuku;

  static fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static fromDynamic(dynamic dynamicData) {
    final model = JurnalModel();
    model.id = dynamicData['id'];
    model.idUserCreate = dynamicData['id_user_create'];
    model.idUserUpdate = dynamicData['id_user_update'];
    model.idUserTutupbuku = dynamicData['id_user_tutupbuku'];
    model.idUserBatal = dynamicData['id_user_batal'];
    model.no = dynamicData['no'];
    model.tanggal = dynamicData['tanggal'];
    model.catatan = dynamicData['catatan'];
    model.idProyek = dynamicData['id_proyek'];
    model.debit = dynamicData['debit'];
    model.kredit = dynamicData['kredit'];
    model.tutupbuku = dynamicData['tutupbuku'];
    model.batal = dynamicData['batal'];
    model.batalketerangan = dynamicData['batalketerangan'];
    model.idTutupbuku = dynamicData['id_tutupbuku'];
    return model;
  }
}
