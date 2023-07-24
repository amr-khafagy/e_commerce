import 'package:ecommerce/controller/favourite/favouriteview.dart';
import 'package:ecommerce/view/widget/favourite/favouriteitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListFavouriteItems extends StatelessWidget {
  const ListFavouriteItems({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
  FavouriteViewControllIMP controller=Get.put(FavouriteViewControllIMP());
    return
    Column(
      children: [
         GridView.builder(
           itemCount: controller.favouriteItems.length,
           shrinkWrap: true,
           physics:const NeverScrollableScrollPhysics(),
           gridDelegate:
           const SliverGridDelegateWithFixedCrossAxisCount(
               childAspectRatio: .7,
               crossAxisCount: 2),
           itemBuilder:(context,index){
             return FavouriteItems(favouritesmodel:controller.favouriteItems[index],);
           })
      ],
    );
  }
}
