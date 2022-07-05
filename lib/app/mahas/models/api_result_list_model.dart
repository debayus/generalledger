import 'dart:convert';

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
    model.limit = data['data']['per_page'];
    model.datas = data['data']['data'];
    model.maxPage = model.totalRowCount == 0
        ? 0
        : (model.totalRowCount! / model.limit!).ceil() - 1;
    return model;
  }
}
