import 'package:ecommerce/controller/orders/orderarchieve.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/cart/cart_app_bar.dart';

import 'package:ecommerce/view/widget/checkout/archieve.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Archieve extends StatelessWidget {
  const Archieve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(OrderArchieveController());
    return Scaffold(
      body: GetBuilder<OrderArchieveController>(builder: (controller) {
        return HandlingDataView(statuesRequest: controller.statuesRequest, widget:Column(
          children: [
            Column(
              children: [
                const CartAppBar(tittle: "Archieve"),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.ordersList.length,
                  itemBuilder: (context, index) {
                    return ArchieveOrdersCard(orderslistmodel: controller.ordersList[index]);
                  },
                ),
              ],
            ),
          ],
        ));
      }),
    );
  }
}
