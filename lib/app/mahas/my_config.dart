import 'package:flutter/material.dart';
import 'package:generalledger/app/mahas/services/http_api.dart';

class MyConfig {
  static const Color fontColor = Colors.black;
  static const Color backgroundColor = Colors.white;
  static const MaterialColor primaryColor = MaterialColor(
    0xFF33428a,
    <int, Color>{
      50: Color(0xFFe8eaf3),
      100: Color(0xFFc4cae2),
      200: Color(0xFF9ea8ce),
      300: Color(0xFF7986ba),
      400: Color(0xFF5d6cac),
      500: Color(0xFF42539f),
      600: Color(0xFF3c4b96),
      700: Color(0xFF33428a),
      800: Color(0xFF2c387e),
      900: Color(0xFF202767),
    },
  );
  static const Color primaryColorRevenge = Colors.white;
  static const Color primaryGrey = Color(0xff292929);
  static const Color primaryColorButton = Color(0xff2c944c);
  static const Color colorSemiTransparent = Color(0xffD9FFFFFF);
  static const Color greyInputan = Color(0xffD0D0D0);
  static const Color colorBlack = Color(0xffff000000);
  static const Color colorRed = Color(0xffE81224);
  static const Color colorBlue = Color(0xff0088FF);
  static const Color colorGreen = Color(0xff7FBA00);
  static const Color colorOrange = Color(0xffFFB900);
  static const Color colorBrown = Color(0xff3C2616);

  static Future<bool> initLogin() async {
    final r = await HttpApi.apiGet('/api/user');
    return r.success ? r.body['id_perusahaan'] == null : false;
  }
}

class MyConfigTextSize {
  static const double h1 = 24;
  static const double h2 = 22;
  static const double h3 = 20;
  static const double h4 = 18;
  static const double h5 = 16;
  static const double h6 = 14;
  static const double normal = 12;
}

class MyErrorCode {
  static const int code404 = 404;
  static const int code500 = 500;
  static const int code401 = 401;
  static const int code400 = 400;
  static const int code409 = 409;
  static const int code307 = 307;
}
