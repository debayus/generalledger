import 'dart:convert';

class ApiResultPostModel {
  int? id;

  static fromJson(String jsonString) {
    final data = json.decode(jsonString);
    return fromDynamic(data);
  }

  static fromDynamic(dynamic data) {
    final model = ApiResultPostModel();
    model.id = data['Id'];
    return model;
  }
}
