import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class NumberOfItems extends StatelessWidget {
  final String? numberOfItemsOfCart;
  const NumberOfItems({Key? key,required this.numberOfItemsOfCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      decoration: BoxDecoration(
          color: AppColor.primarycolor,
          borderRadius: BorderRadius.circular(60)),
      child:  Center(
        child: Text(
          "You Have $numberOfItemsOfCart Items In Yourt Cart",
          style:const TextStyle(color: AppColor.grey, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
