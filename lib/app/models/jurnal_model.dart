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
  List<JurnalDetailModel>? detail;

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
    if (dynamicData['detail'] != null) {
      final detailT = dynamicData['detail'] as List;
      model.detail = [];
      for (var i = 0; i < detailT.length; i++) {
        model.detail!.add(JurnalDetailModel.fromDynamic(detailT[i]));
      }
    }
    return model;
  }
}

class JurnalDetailModel {
  int? idJurnal;
  int? idAkun;
  double? debit;
  double? kredit;
  String? catatan;
  String? komponen;
  int? idStrukturAkun;
  int? idStrukturAkunDetail;
  String? normalpos;
  int? level;
  String? no;
  String? nama;

  static fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static fromDynamic(dynamic dynamicData) {
    final model = JurnalDetailModel();
    model.idJurnal = dynamicData['id_jurnal'];
    model.idAkun = dynamicData['id_akun'];
    model.debit = dynamicData['debit'];
    model.kredit = dynamicData['kredit'];
    model.catatan = dynamicData['catatan'];
    model.komponen = dynamicData['komponen'];
    model.idStrukturAkun = dynamicData['id_struktur_akun'];
    model.idStrukturAkunDetail = dynamicData['id_struktur_akun_detail'];
    model.normalpos = dynamicData['normalpos'];
    model.level = dynamicData['level'];
    model.no = dynamicData['no'];
    model.nama = dynamicData['nama'];
    return model;
  }
}
