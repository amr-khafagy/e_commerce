import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onboardinglist.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 10),
                          duration: const Duration(milliseconds: 900),
                          height: 6.h,
                          width:controller.currentpage==index?20.w:6.w,
                          decoration: BoxDecoration(
                              color: AppColor.primarycolor,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
