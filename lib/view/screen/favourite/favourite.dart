import 'package:ecommerce/controller/favourite/favouriteview.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/favourite/listfavouriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavouriteViewControllIMP());
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.all(10),
        child: GetBuilder<FavouriteViewControllIMP>(
          builder: (controller) {
            return ListView(children: [
             const SizedBox(height:10),
              HandlingDataView(
                  statuesRequest: controller.statuesRequest,
                  widget:const ListFavouriteItems())
            ]);
          },
        ),
      ),
    );
  }
}
