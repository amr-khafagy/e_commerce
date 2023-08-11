import 'package:ecommerce/controller/home/homescreen_controller.dart';

import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/Home/customappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerIMP());
    return GetBuilder<HomeScreenControllerIMP>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: IconButton(
                    icon: const Icon(Icons.shopping_basket_outlined),
                    onPressed: () {
                      Get.offNamed(AppRoutes.cart);
                    }),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomAppBarHome(),
              body: WillPopScope(
                onWillPop: () {controller.onPop();
                  return Future.value(false);
                },
                child: controller.listpage.elementAt(controller.currentpage),
              ),
            ));
  }
}
