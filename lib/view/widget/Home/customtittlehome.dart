import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTittleHome extends StatelessWidget {
  final String tittle;
  const CustomTittleHome({Key? key, required this.tittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:EdgeInsets.symmetric(vertical:20.h),
      child: Text(tittle,
          style: TextStyle(
              fontSize: 20.sp,
              color: AppColor.primarycolor,
              fontWeight: FontWeight.bold)),
    );
  }
}
