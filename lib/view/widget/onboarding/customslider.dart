import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomSlider extends GetView<OnBoardingControllerImp> {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
        onPageChanged: (val){
controller.onpagechanged(val);
        },
        itemBuilder: (context, i) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  onboardinglist[i].tittle!,
                  style:Theme.of(context).textTheme.headline1),
                Image.asset(onboardinglist[i].image!,
                    width: 200.w, height: 200.h, fit: BoxFit.cover),
                Text(onboardinglist[i].content!,
                    style:Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center),
              ],
            ),
        itemCount: onboardinglist.length);
  }
}
