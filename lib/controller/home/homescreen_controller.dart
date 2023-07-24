import 'package:ecommerce/view/screen/home/Home.dart';
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
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Profile"),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Favourite"),
        ),
      ],
    ),
  ];
  List tittlebottombar = ["home", "Setting", "Profile", "Notification"];
  List iconbottombar = [
    Icons.home,
    Icons.settings,
    Icons.person_outlined,
    Icons.notifications_active_outlined,
  ];

  @override
  changepage(int page) {
    currentpage = page;
    update();
  }
}
