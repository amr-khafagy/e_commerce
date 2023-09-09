import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethod extends StatelessWidget {
  final String paymentName;
  final bool isActive;
  final void Function()? onPaymentMethodTap;
  const PaymentMethod({Key? key, required this.paymentName, required this.isActive, this.onPaymentMethodTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: onPaymentMethodTap,
      child: Container(
        padding:EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        margin:EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
        decoration: BoxDecoration(
          border: Border.all(color:AppColor.primarycolor),
            color:isActive?AppColor.primarycolor:null,
            borderRadius: BorderRadius.circular(20)),
        child:  Text(
          paymentName,
          style:  TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
