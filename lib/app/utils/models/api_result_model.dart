import 'dart:convert';

class ApiResultModel {
  bool success;
  dynamic body;
  String? message;

  ApiResultModel(
    this.success, {
    this.body,
    this.message,
  }) {
    if (body != null && body is String) {
      body = json.decode(body);
      if (!success) {
        message = body['message'];
      }
    } else if (!success && message != null) {
      message = body.toString();
    }
  }
}
