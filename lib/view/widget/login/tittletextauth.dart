import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TittleTextAuth extends StatelessWidget {
  final String tittletext;
  const TittleTextAuth({Key? key, required this.tittletext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      tittletext,
        style:TextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp,color: AppColor.black),
    );
  }
}
