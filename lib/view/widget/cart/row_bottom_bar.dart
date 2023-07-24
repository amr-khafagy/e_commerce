import 'package:flutter/material.dart';

class CartRowBottomBar extends StatelessWidget {
  final String? titleOfPrice;
  final String? price;
  const CartRowBottomBar({Key? key,required this.titleOfPrice, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        Text(titleOfPrice!),
        Text(price!)
      ],
    );
  }
}