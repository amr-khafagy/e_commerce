import 'package:ecommerce/controller/home/homecontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CashBackContainer extends GetView<HomeControllerIMP> {
  final String tittle;
  final String body;
  const CashBackContainer({Key? key, required this.tittle, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.primarycolor,
            ),
            height: 150.h,
            child:  ListTile(
              title: Text(tittle,
                  style:TextStyle(fontSize: 20.sp,color: Colors.white)),
              subtitle:
              Text(body, style: TextStyle(fontSize: 30.sp,color: Colors.white)),
            ),
          ),

        ],
      ),
    );
  }
}
