import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class NumberOfItems extends StatelessWidget {
  final String? numberOfItemsOfCart;
  const NumberOfItems({Key? key,required this.numberOfItemsOfCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 20.w),
      height: 30.h,
      decoration: BoxDecoration(
          color: AppColor.primarycolor,
          borderRadius: BorderRadius.circular(60)),
      child:  Center(
        child: Text(
          "${"67".tr} $numberOfItemsOfCart ${"68".tr}",
          style: TextStyle(color: AppColor.grey, fontSize: 18.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
