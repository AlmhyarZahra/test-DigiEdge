import 'package:auto/core/translation/app_translation.dart';
import 'package:auto/core/utils/general_util.dart';
import 'package:auto/ui/views/home/home_view.dart';
import 'package:auto/ui/views/welcome/welcome_view.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        supportedLocales: const [
          Locale("en"),
        ],
        localizationsDelegates: const [
          CountryLocalizations.delegate,
        ],
        theme: ThemeData(
          fontFamily: 'Alexandria',
        ),
        defaultTransition: GetPlatform.isAndroid? Transition.rightToLeftWithFade : Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 400),
        translations: AppTranlation(),
        locale: getLocal(),
        fallbackLocale: getLocal(),
        builder: EasyLoading.init(builder: BotToastInit()),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        title: 'Auto',
        home: storage.getFirstLanuch()? const WelcomeView(): const HomeView());
  }
}

Locale getLocal() {
  if (storage.getAppLanguage() == 'ar') {
    return const Locale('ar', 'SA');
  } else {
    return const Locale('en', 'US');
  }
}
