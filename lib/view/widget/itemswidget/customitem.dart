import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favourite/favourite_controller.dart';
import 'package:ecommerce/controller/items/itemscontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/function/database_translation.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';
import 'package:ecommerce/data/model/itemmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomItem extends GetView<ItemsControllerIMP> {
  final ItemsModel itemsModel;

  const CustomItem({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "${AppLinks.itemssimage}/${itemsModel.itemsImage!}",
                    height: 80,
                  ),
                  //TODO CachedNetworkImage
                  Text(
                    "${dataBaseTranslation(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rating: ${itemsModel.itemsrating}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${itemsModel.itemspricediscount}\$",
                        style: const TextStyle(
                            color: AppColor.primarycolor, fontSize: 16),
                      ),
                      GetBuilder<FavouriteControllerIMP>(
                          builder: (controller) => IconButton(
                                onPressed: () {
                                  if (controller
                                          .isfavourite[itemsModel.itemsId] ==
                                      "1") {
                                    controller.setfavourite(
                                        itemsModel.itemsId, "0");
                                    controller
                                        .removefavourite(itemsModel.itemsId!);
                                  } else {
                                    controller.setfavourite(
                                        itemsModel.itemsId, "1");
                                    controller
                                        .addfavourite(itemsModel.itemsId!);
                                  }
                                },
                                icon: controller
                                            .isfavourite[itemsModel.itemsId] ==
                                        "1"
                                    ? const Icon(Icons.favorite_outlined)
                                    : const Icon(Icons.favorite_outline),
                                color: AppColor.favoritecolor,
                              ))
                    ],
                  )
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != "0")
              Positioned(
                top: 4,
               right: 0,
                child: Container(child: Image.asset(AppImageAsset.saleimage,width: 70,height: 70)),
              )
          ],
        ),
      ),
    );
  }
}
