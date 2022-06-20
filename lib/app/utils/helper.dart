import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:generalledger/app/utils/components/others/text_component.dart';
import 'package:generalledger/app/utils/icons/font_awesome5_icons.dart';
import 'package:generalledger/app/utils/my_config.dart';

class Helper {
  static String? dateToString(DateTime? date,
      {String format = 'yyyy-MM-dd HH:mm', bool returnNull = false}) {
    if (date == null) return returnNull ? null : "";
    final DateFormat formatter = DateFormat(format);
    final String formatted = formatter.format(date);
    return formatted;
  }

  static DateTime? stringToDate(String? date) {
    if (date == null) return null;
    try {
      return DateTime.parse(date);
    } catch (ex) {
      return null;
    }
  }

  static TimeOfDay? stringToTime(String? time) {
    if (time == null) return null;
    final add = time.indexOf("PM") > 0 ? 12 : 0;
    final r = TimeOfDay(
        hour: int.parse(time.split(":")[0]) + add,
        minute: int.parse(time.split(":")[1].split(' ')[0]));
    return r;
  }

  static Future dialogShow(String message) async {
    await Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextComponent(
              message,
              color: MyConfig.primaryColor.shade900,
            ),
          ],
        ),
        contentPadding:
            EdgeInsets.only(bottom: 0, top: 30, right: 10, left: 10),
        actionsPadding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
        actions: [
          TextButton(
            child: TextComponent(
              "Close",
              color: MyConfig.primaryColor.shade500,
            ),
            onPressed: () {
              Get.back(result: false);
            },
          ),
        ],
      ),
    );
  }

  static Future dialogWarning(String? message) async {
    await Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              FontAwesome5.exclamation_circle,
              color: MyConfig.primaryColor.shade800,
              size: 40,
            ),
            Padding(padding: EdgeInsets.all(7)),
            TextComponent(
              message ?? "-",
              color: MyConfig.primaryColor.shade900,
            ),
          ],
        ),
      ),
    );
  }

  static Future dialogQuesion({
    String? message,
    IconData? icon,
    String? submitText,
  }) async {
    return await Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? FontAwesome5.question_circle,
              color: MyConfig.primaryColor.shade800,
              size: 40,
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextComponent(
              message ?? "",
              color: MyConfig.primaryColor.shade900,
            ),
          ],
        ),
        contentPadding:
            EdgeInsets.only(bottom: 0, top: 20, right: 10, left: 10),
        actionsPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
        actions: [
          TextButton(
            child: TextComponent(
              "Close",
              color: MyConfig.primaryColor.shade500,
            ),
            onPressed: () {
              Get.back(result: false);
            },
          ),
          TextButton(
            child: TextComponent(
              submitText ?? "OK",
              color: MyConfig.primaryColor.shade900,
            ),
            onPressed: () {
              Get.back(result: true);
            },
          ),
        ],
      ),
    );
  }

  static Future dialogCustomWidget(List<Widget> children) async {
    await Get.dialog(
      AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: children),
        contentPadding:
            EdgeInsets.only(bottom: 0, top: 30, right: 10, left: 10),
        actionsPadding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
        actions: [
          TextButton(
            child: TextComponent(
              "Close",
              color: MyConfig.primaryColor.shade500,
            ),
            onPressed: () {
              Get.back(result: false);
            },
          ),
        ],
      ),
    );
  }

  static get theme {
    return ThemeData(
      fontFamily: GoogleFonts.quicksand().fontFamily,
      primarySwatch: MyConfig.primaryColor,
      scaffoldBackgroundColor: MyConfig.backgroundColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: MyConfig.primaryColor,
        secondary: MyConfig.primaryColor,
      ),
      appBarTheme: AppBarTheme().copyWith(
        iconTheme: IconThemeData().copyWith(
          size: 15,
          color: Colors.white,
        ),
        titleTextStyle: TextStyle().copyWith(
          color: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          color: Colors.white,
          decorationColor: Colors.white,
        ),
      ),
      textTheme: TextTheme().copyWith(
        bodyText1: TextStyle().copyWith(fontSize: 10),
        bodyText2: TextStyle().copyWith(fontSize: 10),
      ),
    );
  }

  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static void backOnPress({
    dynamic result,
    required String page,
    bool questionBack = true,
    bool editable = false,
    dynamic parametes,
  }) async {
    if (questionBack && editable) {
      final r = await Helper.dialogQuesion(
        message: 'Are you sure you want to come back ?',
        submitText: 'Yes',
      );
      if (!r) return;
    }
    if (Get.arguments != null) {
      if (Get.arguments['back'] as bool) {
        Get.back(result: result);
        return;
      }
    }
    Get.offAllNamed(page, parameters: parametes);
  }

  static Future? toNamed(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    return Get.toNamed(
      page,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
  }

  static String intToString(int value, int length, String character) {
    var strVal = '$value';
    var r = '';
    for (var i = 0; i < length - strVal.length; i++) {
      r += character;
    }
    r += strVal;
    return r;
  }
}
