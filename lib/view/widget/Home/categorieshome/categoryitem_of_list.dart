
import 'package:ecommerce/controller/home/homecontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/database_translation.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoryItemsHome extends GetView<HomeControllerIMP> {
  final CategoriesModel categoriesModel;
  final int? i;
  const CategoryItemsHome({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.primarycolor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: 70,
            height: 70,
            child: SvgPicture.network(
              "${AppLinks.categoriesimage}/${categoriesModel.categoriesImage}",
              color: AppColor.grey,
            ),
          ),
          Text(
            "${dataBaseTranslation(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: const TextStyle(color: Colors.black, fontSize: 13),
          )
        ],
      ),
      onTap: (){
        controller.goToItem(controller.categories,i!,categoriesModel.categoriesId!);
      },
    );
  }
}
