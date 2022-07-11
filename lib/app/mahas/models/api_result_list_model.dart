import 'dart:convert';

import 'package:generalledger/app/mahas/my_config.dart';

class ApiResultListModel {
  int? totalRowCount;
  int? limit;
  int? maxPage;
  List<dynamic>? datas;

  static fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static fromDynamic(dynamic data) {
    final model = ApiResultListModel();
    model.totalRowCount = data['totalRowCount'];
    if (MyConfig.server == "Laravel") {
      model.limit = data['data']['per_page'];
      model.datas = data['data']['data'];
    } else {
      model.limit = data['pageSize'];
      model.datas = data['list'];
    }
    model.maxPage = model.totalRowCount == 0
        ? 0
        : (model.totalRowCount! / model.limit!).ceil() - 1;
    return model;
  }
}
