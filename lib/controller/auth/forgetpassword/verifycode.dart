import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeControll extends GetxController {
  checkcode();

  gotoresetpassword(String verifyCode);
}

class VerifyCodeControllIMP extends VerifyCodeControll {
  late String code;
  VerifyCodeData verifyCodedata =
  VerifyCodeData(crud: Get.find());
  StatuesRequest statuesRequest=StatuesRequest.none;
  String? email;
  List data = [];
  @override
  checkcode() {}

  @override
  gotoresetpassword(verifyCode) async{
    statuesRequest = StatuesRequest.loading;
    update();
    var response =
        await verifyCodedata.postData(email!, verifyCode);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoutes.resetpassword,arguments: {"email":email});
      } else {
        Get.defaultDialog(
            title: "48".tr, middleText: "50".tr);
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit;
  }
}