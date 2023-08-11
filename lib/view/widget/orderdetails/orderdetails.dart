import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class OrderDetailsCard extends StatelessWidget {
 final List cartModel;
  const OrderDetailsCard({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Table(
        children: [
          const TableRow(children: [
            Text(
              "Item",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: AppColor.favoritecolor,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              "QTY",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: AppColor.favoritecolor,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              "Price",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: AppColor.favoritecolor,
                  fontWeight: FontWeight.w900),
            ),
          ]),
          ...List.generate(
              cartModel.length,
                  (index) => TableRow(children: [
                Text(
                  cartModel[index].itemsName!,
                  textAlign: TextAlign.center,
                ),
                Text(
                  cartModel[index].itemsCount!,
                  textAlign: TextAlign.center,
                ),
                Text(
                  cartModel[index].itemsprice!,
                  textAlign: TextAlign.center,
                ),
              ]))
        ],
      ),
    );
  }
}
