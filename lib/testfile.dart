import 'package:ecommerce/controller/home/homecontroller.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:ecommerce/view/widget/Home/categorieshome/categoryitem_of_list.dart';
import 'package:ecommerce/view/widget/itemswidget/categoryitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerIMP> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return CategoryItemsHome(
              categoriesModel:controller.categories[index],
              i: index,
            );
          },
        ));
  }
}
