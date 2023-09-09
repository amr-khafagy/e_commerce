import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyTextAuth extends StatelessWidget {
  final String bodytextauth;
  const BodyTextAuth({Key? key, required this.bodytextauth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 10.h,bottom: 15.h),
      child: Text(
        bodytextauth,
        style: TextStyle(fontSize: 15.sp, color: AppColor.grey),
        textAlign: TextAlign.center,
      ),
    );
  }
}
