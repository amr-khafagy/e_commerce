import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutTittleText extends StatelessWidget {
  final String checkoutTittle;
  const CheckoutTittleText({Key? key, required this.checkoutTittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:EdgeInsets.symmetric(vertical: 20.h),
      child: Text(
        checkoutTittle,
        style:  TextStyle(
            color: AppColor.primarycolor,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp),
        textAlign: TextAlign.center,
      ),
    );
  }
}
