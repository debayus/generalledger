import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:generalledger/app/utils/helper.dart';
import 'package:generalledger/app/utils/mahas_server.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final page = await MahasServer.init();
  setPathUrlStrategy();
  runApp(MyApp(
      page: page,
  ));
}

class MyApp extends StatefulWidget {
  final String? page;
  const MyApp({
    Key? key,
    this.page,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: GetMaterialApp(
          title: "General Ledger",
          debugShowCheckedModeBanner: false,
          initialRoute: widget.page ?? Routes.HOME,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          theme: Helper.theme,
        ),
      ),
    );
  }
}
