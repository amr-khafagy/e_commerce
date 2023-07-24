import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favourite/favouriteview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/database_translation.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';
import 'package:ecommerce/data/model/favouritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteItems extends StatelessWidget {
  final FavouritesModel favouritesmodel;

 const FavouriteItems({super.key, required this.favouritesmodel});

  @override
  Widget build(BuildContext context) {
    FavouriteViewControllIMP controller = Get.put(FavouriteViewControllIMP());
    return InkWell(
      onTap: () {
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:"${AppLinks.itemssimage}/${favouritesmodel.itemsImage!}",
                height: 80,
                width: 80,
              ),
              //TODO CachedNetworkImage
              Text(
                "${dataBaseTranslation(favouritesmodel.itemsNameAr, favouritesmodel.itemsName)}",
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rating: ${favouritesmodel.itemsRating}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...List.generate(
                          int.parse(favouritesmodel.itemsRating!),
                          (index) => const Icon(
                                Icons.star,
                                color: AppColor.favoritecolor,
                                size: 15,
                              ))
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${favouritesmodel.itemsPrice}\$",
                    style: const TextStyle(
                        color: AppColor.primarycolor, fontSize: 16),
                  ),
                  IconButton(
                      icon: const Icon(Icons.delete_outline_outlined),
                      color: AppColor.favoritecolor,
                      onPressed: () {
                        controller
                            .removeFromFavourite(favouritesmodel.favouriteId!);
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
