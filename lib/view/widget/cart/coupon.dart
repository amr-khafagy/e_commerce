import 'package:ecommerce/view/widget/cart/cart_bottom_bar.dart';
import 'package:flutter/material.dart';

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
              decoration: const InputDecoration(
                  isDense: true,
                  hintText: "Coupon Cod",
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  border: OutlineInputBorder()),
            )),
        const    SizedBox(width: 10,),
        Expanded(
          flex: 1,
          child: CartButton(
            horizontal: 8,
            vertical:3,
            nameButton: "Apply Coupon",
            onPressButton:onCouponApply,
          ),
        )
      ],
    );
  }
}
