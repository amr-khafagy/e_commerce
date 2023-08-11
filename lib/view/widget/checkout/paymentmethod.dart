import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  final String paymentName;
  final bool isActive;
  final void Function()? onPaymentMethodTap;
  const PaymentMethod({Key? key, required this.paymentName, required this.isActive, this.onPaymentMethodTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: onPaymentMethodTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color:AppColor.primarycolor),
            color:isActive?AppColor.primarycolor:null,
            borderRadius: BorderRadius.circular(20)),
        child:  Text(
          paymentName,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
