import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiddleWare extends GetMiddleware{
@override
  int? get priority=>1;
  MyServices myServices=Get.find();
  @override
  RouteSettings? redirect(String? route){
    if(myServices.sharedPreferences.getString("onboarding")=="1"){
    return const RouteSettings(name: AppRoutes.login);
    }
  }
}