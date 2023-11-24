import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/view/widget/onboarding/custobutton.dart';
import 'package:ecommerce/view/widget/onboarding/customdot.dart';
import 'package:ecommerce/view/widget/onboarding/customslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
        children: [
            Expanded(flex: 3, child: CustomSlider()),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomDot(),
                    CustomButton()
                  ],
                )),
        ],
      ),
          ),
      ));
  }
}
