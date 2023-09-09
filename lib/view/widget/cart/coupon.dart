import 'package:ecommerce/view/widget/cart/cart_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CouponCode extends StatelessWidget {
 final TextEditingController couponController;
 final void Function()? onCouponApply;
  const CouponCode({Key? key, required this.couponController,required this.onCouponApply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: TextFormField(
              controller:couponController ,
              decoration:  InputDecoration(
                  isDense: true,
                  hintText: "69".tr,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                  border: OutlineInputBorder()),
            )),
            SizedBox(width: 10.w,),
        Expanded(
          flex: 1,
          child: CartButton(
            horizontal: 8.w,
            vertical:3.h,
            nameButton: "70".tr,
            onPressButton:onCouponApply,
          ),
        )
      ],
    );
  }
}
