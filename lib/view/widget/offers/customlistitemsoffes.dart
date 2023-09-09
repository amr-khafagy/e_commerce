import 'package:ecommerce/controller/favourite/favourite_controller.dart';
import 'package:ecommerce/controller/offerscontroller.dart';
import 'package:ecommerce/data/model/itemmodel.dart';
import 'package:ecommerce/view/widget/offers/offersCustomItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersListItems extends GetView<OffersController> {
  const OffersListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouriteControllerIMP controllerfav = Get.put(FavouriteControllerIMP());
    return GetBuilder<OffersController>(
        builder: (controller) => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .7),
            itemBuilder: (BuildContext context, index) {
              controllerfav.isfavourite[controller.data[index]['items_id']] =
              controller.data[index]['favourite'];
              return OffersCustomItem(
                  itemsModel: ItemsModel.fromJson(controller.data[index]));
            }));
  }
}
