import 'package:ecommerce/controller/productdetails/productdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/database_translation.dart';
import 'package:ecommerce/view/widget/productdetails/priceandnumber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleAndDescription extends GetView<ProductDetailsControllerIMP> {
  const TitleAndDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerIMP>(builder: (controller){
      return Column(
        children: [
          Text(
            dataBaseTranslation(controller.itemsModel.itemsNameAr,
                controller.itemsModel.itemsName),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            dataBaseTranslation(controller.itemsModel.itemsDescAr,
                controller.itemsModel.itemsDesc),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          NumberAndPrice("${controller.countitems}", () async{
            controller.add();
            await  controller.cartController.refreshpage();
            print(controller.countitems);
          }, () async{
            controller.remove();
            await  controller.cartController.refreshpage();
          }),
          MaterialButton(
            onPressed: () {
              Get.offNamed(AppRoutes.cart);
            },
            color: AppColor.primarycolor,
            padding: EdgeInsets.symmetric(horizontal: Get.width / 3),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Text(
              "Go To Cart",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );
    });
  }
}
