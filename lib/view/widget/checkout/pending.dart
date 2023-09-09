import 'package:ecommerce/controller/orders/pendingorders.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:ecommerce/view/screen/setting/settingdivider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersCard extends GetView<PendingOrdersController> {
  final OrdersModel orderslistmodel;

  const OrdersCard({Key? key, required this.orderslistmodel}) : super(key: key);

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
                "Order Number:#${orderslistmodel.ordersId!}",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                Jiffy(orderslistmodel.ordersDatetime).fromNow(),
                style: TextStyle(
                    color: AppColor.favoritecolor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text(
            "Order type:${controller.ordersType(orderslistmodel.ordersType!)}",
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Text(
            "Order Price:${orderslistmodel.ordersPrice!}",
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Text(
            "Delivery Price:${orderslistmodel.ordersPricedelivery!}",
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Text(
            "payment method:${controller.paymentmethod(orderslistmodel.ordersPaymentmethod!)}",
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Text(
            "Status:${controller.ordersStatues(orderslistmodel.ordersStatues!)}",
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SettingDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Total Price:#${orderslistmodel.ordersTotalprice!}",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColor.favoritecolor),
              ),
              if (orderslistmodel.ordersStatues! == "0")
                MaterialButton(
                  onPressed: () {
                    controller.deleteOrder(orderslistmodel.ordersId!);
                  },
                  color: AppColor.favoritecolor,
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              if (orderslistmodel.ordersStatues! == "3")
                MaterialButton(
                  onPressed: () {
                    controller.goToTracking(orderslistmodel);
                  },
                  color: AppColor.favoritecolor,
                  child: const Text(
                    "Tracking",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              MaterialButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.orderDetail,
                      arguments: {"ordersmodel": orderslistmodel});
                },
                color: AppColor.favoritecolor,
                child: const Text(
                  "Details",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
