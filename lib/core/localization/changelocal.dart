import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
ThemeData apptheme=themeenglish;
  changelanguage(String languagecode) {
    Locale locale = Locale(languagecode);
    myServices.sharedPreferences.setString("language", languagecode);
    apptheme=languagecode=="ar"?themearabic:themeenglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
  }
  @override
  void onInit() {
    String? sharedprefrencelanguage =
        myServices.sharedPreferences.getString("language");
    if (sharedprefrencelanguage == "ar") {
      language = const Locale("ar");
      apptheme=themearabic;
    } else if (sharedprefrencelanguage == "en") {
      language = const Locale("en");
      apptheme=themeenglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
