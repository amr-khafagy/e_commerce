import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onpagechanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentpage = 0;
late PageController pageController;
MyServices myServices=Get.find();
  @override
  next() {
    currentpage++;
    if(currentpage>onboardinglist.length-1){
myServices.sharedPreferences.setString("onboarding","1");
      Get.offAllNamed(AppRoutes.login);
    }else{
    pageController.animateToPage(currentpage, duration:const Duration(milliseconds: 900), curve:Curves.easeInOut);
    }
  }

  @override
  onpagechanged(int index) {
    currentpage = index;
    update();//to update UI
  }
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
