import 'package:ecommerce/controller/productdetails/productdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberAndPrice extends GetView<ProductDetailsControllerIMP> {
  final  String? numberOfProduct;
  final void Function()? onMaximize;
  final void Function()? onMinimize;

  NumberAndPrice(this.numberOfProduct, this.onMaximize, this.onMinimize);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            IconButton(
                onPressed:onMaximize, icon: const Icon(Icons.add)),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child:  Center(
                  child: Text(
                    numberOfProduct!,
                    textAlign: TextAlign.center,
                    style:const TextStyle(color: AppColor.favoritecolor,fontSize:20),
                  )),
            ),
            IconButton(
                onPressed:onMinimize,
                icon: const Icon(Icons.minimize)),
          ],
        ),
        Text(
          "${controller.itemsModel.itemsPrice!}\$",
          style: const TextStyle(
              color: AppColor.favoritecolor,
              fontSize: 30,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
