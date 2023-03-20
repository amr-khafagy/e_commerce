import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControll extends GetxController {
  login();
  togoforgetpassword();
  togosignup();
}

class LoginControllIMP extends LoginControll {
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword=true;
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  @override
  login() {
    if(formstate.currentState!.validate()){
      print("valid");//TODO if login valid
      Get.delete<LoginControllIMP>();

    }else{
      print("not valid");//TODO if login not valid
    }
  }

  @override
  togosignup() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  togoforgetpassword() {
    Get.offNamed(AppRoutes.forgetpassword);
  }
  showpassword(){
    isshowpassword=isshowpassword==true?false:true;
    update();
  }
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
