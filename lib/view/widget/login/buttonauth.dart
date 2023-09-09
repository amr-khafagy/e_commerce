import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonAuth extends StatelessWidget {
  final void Function()? onpressed;
  final String buttontext;

  const ButtonAuth({Key? key, this.onpressed, required this.buttontext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h,bottom: 10.h),
      child: MaterialButton(
        onPressed:onpressed,
        color: AppColor.primarycolor,
        padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 100.w),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Text(
          buttontext,
          style:TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
