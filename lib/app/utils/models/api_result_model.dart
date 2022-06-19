import 'dart:convert';

class ApiResultModel {
  bool success;
  dynamic body;
  String? message;
  int? statusCode;

  ApiResultModel(
    this.success, {
    this.body,
    this.message,
    this.statusCode,
  }) {
    if (statusCode == null) return;
    if (body != null && body is String) {
      try {
        body = json.decode(body);
      } catch (ex) {
        body = null;
      }
    }
    if (statusCode != 200) {
      if (statusCode == 500 || statusCode == 404) {
        message = '$statusCode';
      } else {
        try {
          message = body['message'];
        } catch (ex) {
          message = '-';
        }
      }
    }
  }
}
