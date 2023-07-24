import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';
dataBaseTranslation(columnarabic,columnenglish) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("language")=="ar") {
return columnarabic;
  }else{
   return columnenglish;
  }

}