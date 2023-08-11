import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CheckoutShipping extends StatelessWidget {
  final String addressTitle;
  final String addressSubTitle;
  final bool isactive;
  final void Function()? cardOnTap;
  const CheckoutShipping({Key? key, required this.addressTitle, required this.addressSubTitle, required this.isactive, this.cardOnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:cardOnTap ,
      child: Card(
        color:isactive?AppColor.primarycolor:null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child:ListTile(
            title: Text(addressTitle),
            subtitle: Text(addressSubTitle)),
      ),
    );
  }
}
