import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingControll extends GetxController {
  logout();

  disableNotification();

  address();

  aboutUs();

  contactUS();
}

class SettingcontrollIMP extends SettingControll {
MyServices myServices=Get.find();
  @override
  aboutUs() {}

  @override
  address() {
  }

  @override
  contactUS() {}

  @override
  disableNotification() {}

  @override
  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
