import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/database_translation.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class OrderDetailsCard extends StatelessWidget {
 final List<CartModel> cartModel;
  const OrderDetailsCard({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      child: Table(
        children: [
          TableRow(children: [
            Text(
              "132".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColor.favoritecolor,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              "133".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColor.favoritecolor,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              "134".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColor.favoritecolor,
                  fontWeight: FontWeight.w900),
            ),
          ]),
          ...List.generate(
              cartModel.length,
                  (index) => TableRow(children: [
                Text(
                  dataBaseTranslation(cartModel[index].itemsNameAr!,cartModel[index].itemsName!),
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
