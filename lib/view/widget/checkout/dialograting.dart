import 'package:ecommerce/controller/orders/orderarchieve.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';



// show the dialog
void showDialogRating(BuildContext context,String ordersid) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => RatingDialog(
        initialRating: 1.0,
        // your app's name?
        title:  Text(
          '127'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        // encourage your user to leave a high rating?
        message:Text(
          '128'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.sp),
        ),
        // your app's logo?
        image: Image.asset(AppImageAsset.logo,width: 200.w,height: 200.h,),
        submitButtonText: '125'.tr,
        commentHint: '126'.tr,
        onCancelled: (){} ,
        onSubmitted: (response) {
          OrderArchieveController controller=Get.find();
          controller.submitRating(ordersid,response.rating,response.comment);
        },
      ));
}
