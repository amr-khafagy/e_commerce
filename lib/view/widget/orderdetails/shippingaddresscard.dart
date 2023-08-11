import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';

class ShippingAddressCard extends StatelessWidget {
  final OrdersModel ordersModel;
  const ShippingAddressCard({Key? key, required this.ordersModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          vertical: 20, horizontal: 10),
      child: ListTile(
        title: Text(
            ordersModel.addressName!),
        subtitle: Text(
            "${ordersModel.addressCity!}/${ordersModel.addressStreet!}"),
      ),
    );
  }
}
