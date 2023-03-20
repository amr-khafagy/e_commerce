import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeControll extends GetxController {
  checkcode();

  gotoresetpassword();
}

class VerifyCodeControllIMP extends VerifyCodeControll {
  late String code;

  @override
  checkcode() {}

  @override
  gotoresetpassword() {
    Get.offNamed(AppRoutes.resetpassword);
  }

  @override
  void onInit() {
    super.onInit;
  }
}
