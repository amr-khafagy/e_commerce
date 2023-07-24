
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/database_translation.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';
import 'package:ecommerce/data/model/itemmodel.dart';
import 'package:flutter/material.dart';

class SuggestedItem extends StatelessWidget {
  final ItemsModel itemsModel;

  SuggestedItem({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 100,
          width: 150,
          child: Image.network(
              "${AppLinks.itemssimage}/${itemsModel.itemsImage}"),
        ),
        Container(
          width: 160,
          height: 120,
          decoration: BoxDecoration(
              color: AppColor.black.withOpacity(.3),
              borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
            left: 10,
            child: Text(
              "${dataBaseTranslation(itemsModel.itemsNameAr,itemsModel.itemsName)}",
              style: const TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 14),
            ))
      ],
    );
  }
}
