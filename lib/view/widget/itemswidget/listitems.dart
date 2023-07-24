import 'package:ecommerce/controller/favourite/favourite_controller.dart';
import 'package:ecommerce/controller/items/itemscontroller.dart';
import 'package:ecommerce/data/model/itemmodel.dart';
import 'package:ecommerce/view/widget/itemswidget/customitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItems extends GetView<ItemsControllerIMP> {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouriteControllerIMP controllerfav = Get.put(FavouriteControllerIMP());
    return GetBuilder<ItemsControllerIMP>(
        builder: (controller) => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .7),
            itemBuilder: (BuildContext context, index) {
              controllerfav.isfavourite[controller.items[index]['items_id']] =
                  controller.items[index]['favourite'];
              return CustomItem(
                  itemsModel: ItemsModel.fromJson(controller.items[index]));
            }));
  }
}
