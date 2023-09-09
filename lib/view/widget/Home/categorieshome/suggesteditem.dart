
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/database_translation.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';
import 'package:ecommerce/data/model/itemmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestedItem extends StatelessWidget {
  final ItemsModel itemsModel;

  SuggestedItem({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding:EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          margin:EdgeInsets.symmetric(horizontal: 10.w),
          height: 100.h,
          width: 150.w,
          child: CachedNetworkImage(imageUrl:
              "${AppLinks.itemssimage}/${itemsModel.itemsImage}"),
        ),
        Container(
          width: 160.w,
          height: 120.h,
          decoration: BoxDecoration(
              color: AppColor.black.withOpacity(.3),
              borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
            left: 10.w,
            child: Text(
              "${dataBaseTranslation(itemsModel.itemsNameAr,itemsModel.itemsName)}",
              style:TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 14.sp),
            ))
      ],
    );
  }
}
