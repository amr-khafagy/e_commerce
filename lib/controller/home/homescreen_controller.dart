import 'dart:io';

import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/screen/offers.dart';
import 'package:ecommerce/view/screen/home/Home.dart';
import 'package:ecommerce/view/screen/notification/notification.dart';
import 'package:ecommerce/view/screen/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int page);
}

class HomeScreenControllerIMP extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listpage = [
    const HomePage(),
    const Setting(),
    const Offers(),
    const NotificationPage()
  ];
  List tittlebottombar = ["home", "Setting", "Profile", "Notification"];
  List iconbottombar = [
    Icons.home,
    Icons.settings,
    Icons.local_offer,
    Icons.notifications_active_outlined,
  ];
onPop(){
  Get.defaultDialog(
      title: "Warning",
      middleText: "Do you want exit the app",
      titleStyle:const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColor.primarycolor,
      ),
      onCancel: (){},
      cancelTextColor: AppColor.primarycolor,
      confirmTextColor: Colors.white,
      buttonColor: AppColor.primarycolor,
      onConfirm: (){
        exit(0);
      }
  );
}
  @override
  changepage(int page) {
    currentpage = page;
    update();
  }
}
