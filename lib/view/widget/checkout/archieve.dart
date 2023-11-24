import 'package:ecommerce/controller/orders/orderarchieve.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:ecommerce/view/screen/setting/settingdivider.dart';
import 'package:ecommerce/view/widget/checkout/dialograting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';


class ArchieveOrdersCard extends GetView<OrderArchieveController> {
  final OrdersModel orderslistmodel;

  const ArchieveOrdersCard({Key? key, required this.orderslistmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${"107".tr}:${orderslistmodel.ordersId!}",
                style:
                 TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                Jiffy(orderslistmodel.ordersDatetime).fromNow(),
                style:  TextStyle(
                    color: AppColor.favoritecolor,
                    fontSize:18.sp,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text(
            "${"108".tr}:${controller.ordersType(orderslistmodel.ordersType!)}",
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Text(
            "${"109".tr}:${orderslistmodel.ordersPrice!}",
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Text(
            "${"110".tr}:${orderslistmodel.ordersPricedelivery!}",
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Text(
            "${"111".tr}:${controller.paymentmethod(orderslistmodel.ordersPaymentmethod!)}",
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Text(
            "${"112".tr}:${controller.ordersStatues(orderslistmodel.ordersStatues!)}",
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SettingDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "${"113".tr}:${orderslistmodel.ordersTotalprice!}",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColor.favoritecolor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.orderDetail,arguments: {"ordersmodel":orderslistmodel});
                    },
                    color: AppColor.favoritecolor,
                    child:  Text(
                      "114".tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  if(orderslistmodel.ordersRating == "0")
                  MaterialButton(
                    onPressed: () {
                     showDialogRating(context,orderslistmodel.ordersId!);
                    },
                    color: AppColor.favoritecolor,
                    child:  Text(
                      "115".tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}