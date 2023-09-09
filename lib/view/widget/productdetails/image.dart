import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/productdetails/productdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PositionedImage extends GetView<ProductDetailsControllerIMP> {
  const PositionedImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            height: 200.h,
            decoration: BoxDecoration(
                color: AppColor.primarycolor,
                borderRadius: BorderRadius.circular(25))),
        Positioned(
          top: 50,
          right: Get.width / 8,
          left: Get.width / 8,
          child: Hero(
              tag: "${controller.itemsModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl: '${AppLinks.itemssimage}/${controller.itemsModel.itemsImage!}',
                height: 250.h,
                fit: BoxFit.fill,
              )),
        ),
      ],
    );
  }
}
