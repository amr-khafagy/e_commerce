import 'package:ecommerce/controller/home/homecontroller.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:ecommerce/view/widget/Home/categorieshome/categoryitem_of_list.dart';
import 'package:ecommerce/view/widget/itemswidget/categoryitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerIMP> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) =>  SizedBox(
            width: 10.w,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return CategoryItemsHome(
              categoriesModel:CategoriesModel.fromJson(controller.categories[index]),
               i: index,
            );
          },
        ));
  }
}
