import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/login/buttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SucessSignUp extends StatelessWidget {
  const SucessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "32".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey, fontSize: 30),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: AppColor.primarycolor,
                size: 250,
              ),
              Text("37".tr,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 30)),
              Text("40".tr),
              SizedBox(
                width: double.infinity,
                child: ButtonAuth(
                  buttontext: "31".tr,
                  onpressed: () {
                    Get.offNamed(AppRoutes.login);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
