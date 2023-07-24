import 'package:ecommerce/controller/home/homecontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteFloatingButton extends GetView<HomeControllerIMP> {
  const FavouriteFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.backgroundcolor,
        heroTag: "favouritebutton",
        onPressed: () {
          controller.goToFavourite();
        },
        child: const Icon(Icons.favorite_outline,color: AppColor.grey,));
  }
}
