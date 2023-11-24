import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryType extends StatelessWidget {
  final String deliveryImage;
  final String deliveryName;
  final bool isActive;
  final void Function()? onDeliveytap;
  const DeliveryType({Key? key, required this.deliveryImage, required this.deliveryName, required this.isActive, this.onDeliveytap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDeliveytap,
      child: Container(
        width:120.w,
        height:120.h,
        margin:  EdgeInsets.symmetric(horizontal: 10.w),
        padding:  EdgeInsets.symmetric(vertical: 10.h),
        decoration:BoxDecoration(
          color: isActive?AppColor.primarycolor:null,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.primarycolor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(deliveryImage,width: 60.w,),
             Text(deliveryName)
          ],
        ),
      ),
    );
  }
}
