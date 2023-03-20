import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CustomButton extends GetView<OnBoardingControllerImp> {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        color: AppColor.primarycolor,
        onPressed: () {
          controller.next();
        },
        textColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Text("8".tr));
  }
}
