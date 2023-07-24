import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpControll extends GetxController {
  checkcode();

  gotosuccesssignup(String verifyCodeSignUp);
}

class VerifyCodeSignUpControllIMP extends VerifyCodeSignUpControll {
  VerifyCodeSignUpData verifyCodeSignUpdata =
      VerifyCodeSignUpData(crud: Get.find());
  StatuesRequest statuesRequest=StatuesRequest.none;
  String? email;
  List data = [];

  @override
  checkcode() {}

  @override
  gotosuccesssignup(verifyCodeSignUp) async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response =
    await verifyCodeSignUpdata.postData(email!, verifyCodeSignUp);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoutes.successsignup);
      } else {
        Get.defaultDialog(
            title: "48".tr, middleText: "50".tr);
        statuesRequest = StatuesRequest.failure;
      }
    }
      update();
    }
  resendVerifycode() async {
    verifyCodeSignUpdata.resenddata(email!);
  }
  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit;
  }
}
