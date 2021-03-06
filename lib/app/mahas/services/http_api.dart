import 'dart:convert';
import 'package:generalledger/app/mahas/models/api_result_model.dart';
import 'package:generalledger/app/mahas/my_config.dart';
import 'package:generalledger/app/mahas/services/mahas_server.dart';
import 'package:http/http.dart' as http;

class HttpApi {
  static String urlApi = MyConfig.urlApi;

  static String getUrl(String url) {
    if (url.toUpperCase().contains('HTTPS://') ||
        url.toUpperCase().contains('HTTP://')) {
      return url;
    } else {
      return urlApi + url;
    }
  }

  static ApiResultModel getResult(http.Response r) {
    return ApiResultModel(r.statusCode == 200,
        body: r.body, statusCode: r.statusCode);
  }

  static Future<ApiResultModel> apiGet(String url) async {
    try {
      final token = MahasServer.token;
      final urlX = Uri.parse(getUrl(url));
      final r = await http.get(
        urlX,
        headers: {
          'Authorization': token != null ? 'Bearer $token' : '',
        },
      );
      return getResult(r);
    } catch (ex) {
      return ApiResultModel(false, message: "$ex");
    }
  }

  static Future<ApiResultModel> apiPost(String url, {Object? body}) async {
    try {
      final token = MahasServer.token;
      final urlX = Uri.parse(getUrl(url));
      var r = await http.post(
        urlX,
        headers: {
          'Content-type': 'application/json',
          'Authorization': token != null ? 'Bearer $token' : '',
        },
        body: json.encode(body),
      );
      return getResult(r);
    } catch (ex) {
      return ApiResultModel(false, message: "$ex");
    }
  }

  static Future<ApiResultModel> apiPut(String url, {Object? body}) async {
    try {
      final token = MahasServer.token;
      final urlX = Uri.parse(getUrl(url));
      var r = await http.put(
        urlX,
        headers: {
          'Content-type': 'application/json',
          'Authorization': token != null ? 'Bearer $token' : '',
        },
        body: json.encode(body),
      );
      return getResult(r);
    } catch (ex) {
      return ApiResultModel(false, message: "$ex");
    }
  }

  static Future<ApiResultModel> apiDelete(String url) async {
    try {
      final token = MahasServer.token;
      final urlX = Uri.parse(getUrl(url));
      var r = await http.delete(
        urlX,
        headers: {
          'Authorization': token != null ? 'Bearer $token' : '',
        },
      );
      return getResult(r);
    } catch (ex) {
      return ApiResultModel(false, message: "$ex");
    }
  }
}
