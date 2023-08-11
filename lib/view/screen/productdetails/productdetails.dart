import 'package:ecommerce/controller/productdetails/productdetails_controller.dart';
import 'package:ecommerce/view/widget/productdetails/tittle_and_description.dart';
import 'package:ecommerce/view/widget/productdetails/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerIMP());
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          const PositionedImage(),
          Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 100),
              child:const  TitleAndDescription())
        ],
      )),
    );
  }
}
