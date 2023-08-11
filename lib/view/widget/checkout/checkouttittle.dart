import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CheckoutTittleText extends StatelessWidget {
  final String checkoutTittle;
  const CheckoutTittleText({Key? key, required this.checkoutTittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        checkoutTittle,
        style: const TextStyle(
            color: AppColor.primarycolor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
