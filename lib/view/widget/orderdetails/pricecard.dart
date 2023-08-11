import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  final OrdersModel ordersModel;
  const PriceCard({Key? key, required this.ordersModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:
      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        "Price:${ordersModel.ordersTotalprice}\$",
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: AppColor.favoritecolor,
            fontSize: 20,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}
