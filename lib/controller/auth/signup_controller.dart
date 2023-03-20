import 'package:ecommerce/core/constant/routes.dart';
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
  late TextEditingController confirmpassword;
  bool isshowpassword=true;
 GlobalKey<FormState>formstate=GlobalKey<FormState>();
  @override
  signup() {
if(formstate.currentState!.validate()){
  Get.offNamed(AppRoutes.verifycodesignup);
  Get.delete<SignUpControllIMP>();
}
  }
showpassword(){
    isshowpassword=isshowpassword==true?false:true;
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
    confirmpassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phonenumber.dispose();
    password.dispose();
    confirmpassword.dispose();
    super.dispose();
  }
}
