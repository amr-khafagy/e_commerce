import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartAppBar extends StatelessWidget {
  final String tittle;
  const CartAppBar({Key? key, required this.tittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text(
        tittle,
        style: TextStyle(
            color: AppColor.grey, fontSize: 30.sp, fontWeight: FontWeight.bold),
      ),
      backgroundColor: AppColor.backgroundcolor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColor.grey,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      elevation: 0,
      centerTitle: true,
    );
  }
}
