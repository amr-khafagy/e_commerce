import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/screen/setting/settingdivider.dart';
import 'package:ecommerce/view/widget/cart/coupon.dart';
import 'package:ecommerce/view/widget/cart/row_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerIMP());
    return GetBuilder<CartControllerIMP>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.couponCode == null
                ? CouponCode(
                    couponController: controller.couponController,
                    onCouponApply: () {
                      controller.getCoupon();
                    },
                  )
                : Text(
                    "Your code ${controller.couponCode} has been activated",
                    style: const TextStyle(
                        color: AppColor.primarycolor, fontSize: 20),
                  ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primarycolor, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CartRowBottomBar(
                      price: "${controller.priceitems}",
                      titleOfPrice: "Price",
                    ),
                    CartRowBottomBar(
                      price: "${controller.discountCoupon}%",
                      titleOfPrice: "discount",
                    ),
                    const CartRowBottomBar(
                      price: "10",
                      titleOfPrice: "Shipping",
                    ),
                    const SettingDivider(),
                    CartRowBottomBar(
                      price: "${controller.returnDiscount()}",
                      titleOfPrice: "Total",
                    ),
                  ]),
            ),
            CartButton(
              horizontal: 5,
              vertical: 7,
              nameButton: "place order",
              onPressButton: () {
                controller.gotoOrders();
              },
            )
          ],
        ),
      );
    });
  }
}

class CartButton extends StatelessWidget {
  final double horizontal;
  final double vertical;
  final String nameButton;
  final void Function()? onPressButton;

  const CartButton(
      {Key? key,
      required this.horizontal,
      required this.vertical,
      required this.nameButton,
      this.onPressButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressButton,
      color: AppColor.primarycolor,
      padding: EdgeInsets.symmetric(
          horizontal: Get.width / horizontal, vertical: vertical),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        nameButton,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
