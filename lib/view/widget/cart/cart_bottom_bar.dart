import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/screen/setting/settingdivider.dart';
import 'package:ecommerce/view/widget/cart/coupon.dart';
import 'package:ecommerce/view/widget/cart/row_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerIMP());
    return GetBuilder<CartControllerIMP>(builder: (controller) {
      return Container(
        padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                    "${"71".tr} ${controller.couponCode} ${"72".tr}",
                    style: TextStyle(
                        color: AppColor.primarycolor, fontSize: 20.sp),
                  ),
             SizedBox(
              height: 10.h,
            ),
            Container(
              padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primarycolor, width: 2.w),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CartRowBottomBar(
                      price: "${controller.priceitems}",
                      titleOfPrice: "73".tr,
                    ),
                    CartRowBottomBar(
                      price: "${controller.discountCoupon}%",
                      titleOfPrice: "74".tr,
                    ),
                     CartRowBottomBar(
                      price: "${controller.priceitems/5}",
                      titleOfPrice: "75".tr,
                    ),
                    const SettingDivider(),
                    CartRowBottomBar(
                      price: "${controller.returnDiscount()}",
                      titleOfPrice: "76".tr,
                    ),
                  ]),
            ),
            CartButton(
              horizontal: 5.w,
              vertical: 7.h,
              nameButton: "77".tr,
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
