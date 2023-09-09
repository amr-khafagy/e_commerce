
import 'package:ecommerce/controller/items/itemscontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/database_translation.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryItem extends GetView<ItemsControllerIMP> {
  final CategoriesModel categoriesModel;
  final int i;

  const CategoryItem({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          GetBuilder<ItemsControllerIMP>(
              builder: (controller) => Container(
                padding:
                EdgeInsets.only(right: 10.w, left: 10.w, bottom: 5.h),
                decoration: controller.selectedcat == i
                    ? const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 3, color: AppColor.primarycolor)))
                    : null,
                child: Text(
                  "${dataBaseTranslation(categoriesModel.categoriesNameAr,categoriesModel.categoriesName)}",
                  style:
                  TextStyle(fontSize: 20.sp, color: AppColor.grey),
                ),
              ))
        ],
      ),
      onTap: () {
        controller.changeCat(i,categoriesModel.categoriesId!);
      },
    );
  }
}
