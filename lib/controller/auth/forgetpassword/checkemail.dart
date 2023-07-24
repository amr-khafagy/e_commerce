import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordControll extends GetxController {
  checkemail();
}

class ForgetPasswordControllIMP extends ForgetPasswordControll {
  StatuesRequest statuesRequest=StatuesRequest.none;
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CheckemailData checkEmailData = CheckemailData(crud: Get.find());
List data=[];
  @override
  checkemail() async {
    if (formstate.currentState!.validate()) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      statuesRequest=handlingData(response);
      if (StatuesRequest.success == statuesRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.verifycode,arguments:{"email":email.text});
        } else {
          Get.defaultDialog(
              title: "48".tr, middleText: "49".tr);
          statuesRequest = StatuesRequest.failure;
        }
      }

      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit;
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
