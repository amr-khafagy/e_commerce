import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordControll extends GetxController {
  checkemail();
  gotoverifycode();
}

class ForgetPasswordControllIMP extends ForgetPasswordControll {
  late TextEditingController email;
GlobalKey<FormState>formstate=GlobalKey<FormState>();
  @override
  checkemail() {}

  @override
  gotoverifycode() {
if(formstate.currentState!.validate()){
  Get.offNamed(AppRoutes.verifycode);
}else{
  print("Not Valid");
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
