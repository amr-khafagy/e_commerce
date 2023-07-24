import 'package:ecommerce/controller/productdetails/productdetails_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/database_translation.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';
import 'package:ecommerce/view/widget/productdetails/tittle_and_description.dart';
import 'package:ecommerce/view/widget/productdetails/image.dart';
import 'package:ecommerce/view/widget/productdetails/priceandnumber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
  ProductDetailsControllerIMP controller =
      Get.put(ProductDetailsControllerIMP());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: ListView(
          children: [
            const PositionedImage(),
            Container(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 100),
                child:const  TitleAndDescription())
          ],
        )),
      ),
    );
  }
}
