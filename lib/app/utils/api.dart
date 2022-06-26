// import 'package:dio/dio.dart';
// import 'package:generalledger/app/utils/mahas_server.dart';
// import 'package:generalledger/app/utils/models/api_result_model.dart';

class Api {
  // static String urlApi = 'http://192.168.0.109:8000';
  static String urlApi = 'http://192.168.1.141:8000';

  // static String setErrorMessage(dynamic error) {
  //   if (error is DioError) {
  //     if (error.type == DioErrorType.connectTimeout) {
  //       return error.message;
  //     } else if (error.type == DioErrorType.sendTimeout) {
  //       return error.message;
  //     } else if (error.type == DioErrorType.receiveTimeout) {
  //       return error.message;
  //     } else if (error.type == DioErrorType.response) {
  //       return error.response?.data['Message'] +
  //           "\n" +
  //           error.response?.data['Errors']
  //               .toString()
  //               .replaceAll("[", "")
  //               .replaceAll("]", "");
  //     } else if (error.type == DioErrorType.other) {
  //       return error.message;
  //     } else {
  //       return error.message;
  //     }
  //   } else {
  //     return "$error";
  //   }
  // }

  // static String getUrl(String url) {
  //   if (url.toUpperCase().contains('HTTPS://') ||
  //       url.toUpperCase().contains('HTTP://')) {
  //     return url;
  //   } else {
  //     return urlApi + url;
  //   }
  // }

  // static Future<Dio> baseUrlDio() async {
  //   var dios = Dio();
  //   final optionsnya = BaseOptions(
  //     connectTimeout: 15000,
  //     receiveTimeout: 15000,
  //     contentType: Headers.jsonContentType,
  //     responseType: ResponseType.json,
  //     validateStatus: (_) => true,
  //     headers: MahasServer.token != null
  //         ? ({'Authorization': 'Bearer ${MahasServer.token!}'})
  //         : null,
  //   );
  //   dios.options = optionsnya;
  //   return dios;
  // }

  // static Future<ApiResultModel> apiGet(
  //   String url,
  // ) async {
  //   try {
  //     var dio = await baseUrlDio();
  //     Response r = await dio.get(getUrl(url));
  //     var message = (r.data.runtimeType == String || r.data.runtimeType == int)
  //         ? null
  //         : r.data?["Message"];
  //     return ApiResultModel(
  //       r.statusCode == 200,
  //       body: r.data,
  //       message: message,
  //     );
  //   } catch (ex) {
  //     return ApiResultModel(false, message: setErrorMessage(ex));
  //   }
  // }

  // static Future<ApiResultModel> apiPost(
  //   String url, {
  //   Object? body,
  //   Map<String, dynamic>? formData,
  // }) async {
  //   try {
  //     var dio = await baseUrlDio();
  //     Response r = await dio.post(
  //       getUrl(url),
  //       data: body ?? FormData.fromMap(formData!),
  //     );
  //     var message = (r.data.runtimeType == String || r.data.runtimeType == int)
  //         ? null
  //         : r.data?["Message"];
  //     return ApiResultModel(
  //       r.statusCode == 200,
  //       body: r.data,
  //       message: message,
  //     );
  //   } catch (ex) {
  //     return ApiResultModel(false, message: setErrorMessage(ex));
  //   }
  // }

  // static Future<ApiResultModel> apiPut(String url,
  //     {Object? body, Map<String, dynamic>? formData}) async {
  //   try {
  //     var dio = await baseUrlDio();
  //     Response r = await dio.put(
  //       getUrl(url),
  //       data: body ?? FormData.fromMap(formData!),
  //     );
  //     var message = (r.data.runtimeType == String || r.data.runtimeType == int)
  //         ? null
  //         : r.data?["Message"];
  //     return ApiResultModel(
  //       r.statusCode == 200,
  //       body: r.data,
  //       message: message,
  //     );
  //   } catch (ex) {
  //     return ApiResultModel(false, message: setErrorMessage(ex));
  //   }
  // }

  // static Future<ApiResultModel> apiDelete(
  //   String url,
  // ) async {
  //   try {
  //     var dio = await baseUrlDio();
  //     Response r = await dio.delete(getUrl(url));
  //     var message = (r.data.runtimeType == String || r.data.runtimeType == int)
  //         ? null
  //         : r.data?["Message"];
  //     return ApiResultModel(
  //       r.statusCode == 200,
  //       body: r.data,
  //       message: message,
  //     );
  //   } catch (ex) {
  //     return ApiResultModel(false, message: setErrorMessage(ex));
  //   }
  // }
}
