import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectLanguageButton extends StatelessWidget {
  final String buttontext;
  final void Function()? onPressed;
   const SelectLanguageButton({Key? key, required this.buttontext, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      onPressed:onPressed,
      color: AppColor.primarycolor,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child:  Text(
        buttontext,
        style: TextStyle(fontSize: 20.sp, color: Colors.white),
      ),

    );
  }
}
