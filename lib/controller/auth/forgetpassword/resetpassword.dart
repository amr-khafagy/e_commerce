import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordControll extends GetxController {
  checknewpassword();
  gotosuccessresetpassword();
}

class ResetPasswordControllIMP extends ResetPasswordControll {
  late TextEditingController newpassword;
  late TextEditingController confirmnewpassword;
  bool isshowpassword=true;

  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  @override
  checknewpassword() {}

  @override
  gotosuccessresetpassword() {
    if(formstate.currentState!.validate()){
      Get.offNamed(AppRoutes.successresetpassword);
    }else{
      print("not valid");
    }
  }
  showpassword(){
    isshowpassword=isshowpassword==true?false:true;
    update();
  }
  @override
  void onInit() {
    newpassword = TextEditingController();
    confirmnewpassword = TextEditingController();
    super.onInit;
  }

  @override
  void dispose() {
    newpassword.dispose();
    confirmnewpassword.dispose();
    super.dispose();
  }
}
