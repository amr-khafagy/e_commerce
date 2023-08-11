import 'package:ecommerce/controller/items/itemscontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/itemswidget/listcategoriesitem.dart';
import 'package:ecommerce/view/widget/itemswidget/listitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerIMP());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              const ListCategoriesItem(),
              GetBuilder<ItemsControllerIMP>(builder: (controller) {
                return HandlingDataView(
                    statuesRequest: controller.statuesRequest,
                    widget: const ListItems());
              })
            ],
          )),
    );
  }
}
