import 'package:ecommerce/controller/orders/checkoutcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/cart/cart_app_bar.dart';
import 'package:ecommerce/view/widget/cart/cart_bottom_bar.dart';
import 'package:ecommerce/view/widget/checkout/checkoutshipping.dart';
import 'package:ecommerce/view/widget/checkout/checkouttittle.dart';
import 'package:ecommerce/view/widget/checkout/deliverytype.dart';
import 'package:ecommerce/view/widget/checkout/paymentmethod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutController());
    return Scaffold(
      body: GetBuilder<CheckOutController>(builder: (checkoutcontroller) {
        return HandlingDataView(
            statuesRequest: checkoutcontroller.statuesRequest,
            widget: ListView(
              children: [
                CartAppBar(tittle: "78".tr),
                CheckoutTittleText(checkoutTittle: "80".tr),
                PaymentMethod(
                    paymentName: "79".tr,
                    isActive:
                        checkoutcontroller.paymentMethod == "0" ? true : false,
                    onPaymentMethodTap: () {
                      checkoutcontroller.choosePaymentMethod("0");
                    }),
                PaymentMethod(
                    paymentName: "81".tr,
                    isActive:
                        checkoutcontroller.paymentMethod == "1" ? true : false,
                    onPaymentMethodTap: () {
                      checkoutcontroller.choosePaymentMethod("1");
                    }),
                CheckoutTittleText(checkoutTittle: "82".tr),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DeliveryType(
                        onDeliveytap: () {
                          checkoutcontroller.chooseDelivery("0");
                        },
                        isActive: checkoutcontroller.deliveryType == "0"
                            ? true
                            : false,
                        deliveryImage: AppImageAsset.delivery,
                        deliveryName: "83".tr),
                    DeliveryType(
                        onDeliveytap: () {
                          checkoutcontroller.chooseDelivery("1");
                        },
                        isActive: checkoutcontroller.deliveryType == "1"
                            ? true
                            : false,
                        deliveryImage: AppImageAsset.drivethru,
                        deliveryName: "84".tr)
                  ],
                ),
                if (checkoutcontroller.deliveryType == "0")
                  Column(
                    children: [
                      CheckoutTittleText(checkoutTittle: "85".tr),
                      if (checkoutcontroller.data.isEmpty)
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.addressadd);
                          },
                          child: Text("86".tr),
                        ),
                      ...List.generate(
                          checkoutcontroller.data.length,
                          (index) => CheckoutShipping(
                              cardOnTap: () {
                                checkoutcontroller.chooseShippingAddress(
                                    checkoutcontroller.data[index].addressId!);
                              },
                              addressTitle:
                                  checkoutcontroller.data[index].addressName!,
                              addressSubTitle:
                                  "${checkoutcontroller.data[index].addressCity!}/${checkoutcontroller.data[index].addressStreet!}",
                              isactive: checkoutcontroller.addressId ==
                                      checkoutcontroller.data[index].addressId!
                                  ? true
                                  : false)),
                    ],
                  ),
                CartButton(
                  horizontal: 5,
                  vertical: 7,
                  nameButton: "78".tr,
                  onPressButton: () {
                    checkoutcontroller.checkOut();
                  },
                )
              ],
            ));
      }),
    );
  }
}
