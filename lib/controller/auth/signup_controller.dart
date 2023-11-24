import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpControll extends GetxController {
  signup();
  togologin();
}

class SignUpControllIMP extends SignUpControll {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phonenumber;
  late TextEditingController password;
  bool isshowpassword = true;
  StatuesRequest statuesRequest = StatuesRequest.none;
  SignUpData signUpData = SignUpData(crud: Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List data = [];

  @override
  signup() async {
    if (formstate.currentState!.validate()) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await signUpData.postData(
          username.text, password.text, email.text, phonenumber.text);
      statuesRequest = await handlingData(response);
      if (StatuesRequest.success == statuesRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.verifycodesignup,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "48".tr, middleText: "52".tr);
          statuesRequest = StatuesRequest.failure;
        }
      }

      update();
    } else {}
  }

  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  togologin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phonenumber = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phonenumber.dispose();
    password.dispose();
    super.dispose();
  }
  }
