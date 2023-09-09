import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShippingAddressCard extends StatelessWidget {
  final OrdersModel ordersModel;
  const ShippingAddressCard({Key? key, required this.ordersModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:EdgeInsets.symmetric(
          vertical: 20.h, horizontal: 10.w),
      child: ListTile(
        title: Text(
            ordersModel.addressName!),
        subtitle: Text(
            "${ordersModel.addressCity!}/${ordersModel.addressStreet!}"),
      ),
    );
  }
}
