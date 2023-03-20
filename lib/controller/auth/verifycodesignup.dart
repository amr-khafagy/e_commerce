import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpControll extends GetxController {
  checkcode();

  gotosuccesssignup();
}

class VerifyCodeSignUpControllIMP extends VerifyCodeSignUpControll {
  late String code;

  @override
  checkcode() {}

  @override
  gotosuccesssignup() {
    Get.offNamed(AppRoutes.successsignup);
  }

  @override
  void onInit() {
    super.onInit;
  }
}
