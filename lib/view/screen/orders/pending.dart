import 'package:dartz/dartz.dart';
import 'package:ecommerce/controller/orders/pendingorders.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:ecommerce/view/screen/setting/settingdivider.dart';
import 'package:ecommerce/view/widget/Home/customappbarhome.dart';
import 'package:ecommerce/view/widget/cart/cart_app_bar.dart';
import 'package:ecommerce/view/widget/checkout/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pending extends StatelessWidget {
  const Pending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
      body: GetBuilder<PendingOrdersController>(builder: (controller) {
        return HandlingDataView(statuesRequest: controller.statuesRequest, widget:Column(
          children: [
            CartAppBar(tittle: "Orders"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.ordersList.length,
              itemBuilder: (context, index) {
                return OrdersCard(orderslistmodel: controller.ordersList[index]);
              },
            ),
          ],
        ));
      }),
    );
  }
}

