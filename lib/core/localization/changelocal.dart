import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/function/fcmconfigure.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
  requestPerLocation() async{
    bool serviceEnabled;
    LocationPermission locationPermission;
    serviceEnabled=await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Get.snackbar("Warning","Please Turn On GPS Service");
    }
    locationPermission=await Geolocator.checkPermission();
    if(locationPermission==LocationPermission.denied){
      locationPermission=await Geolocator.requestPermission();
    if(locationPermission==LocationPermission.denied){
      return Get.snackbar("Warning","Please Give Location Permission For Application");
    }
    }if(locationPermission==LocationPermission.deniedForever){
      return Get.snackbar("Warning","You Can't Use App Without GPS");
    }
  }
  @override
  void onInit() {
    requrstNotificationPermission();
    fcmConfig();
    requestPerLocation();
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
