import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/function/database_translation.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';
import 'package:ecommerce/view/widget/cart/card_of_cart.dart';
import 'package:ecommerce/view/widget/cart/cart_app_bar.dart';
import 'package:ecommerce/view/widget/cart/cart_bottom_bar.dart';
import 'package:ecommerce/view/widget/cart/number_of_items_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends GetView<CartControllerIMP> {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerIMP());
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: const CartBottomBar(),
            body: GetBuilder<CartControllerIMP>(
              builder: (cartController) {
                return HandlingDataView(
                  statuesRequest: cartController.statuesRequest,
                  widget: ListView(
                    children: [
                      CartAppBar(tittle: "66".tr),
                      NumberOfItems(
                          numberOfItemsOfCart: "${cartController.totalItems}"),
                      ...List.generate(
                          cartController.cartitems.length,
                          (index) => CardOfCart(
                                itemImage:
                                    "${AppLinks.itemssimage}/${cartController.cartitems[index].itemsImage}",
                                itemName: dataBaseTranslation(
                                    cartController.cartitems[index].itemsNameAr,
                                    cartController.cartitems[index].itemsName),
                                itemprice:
                                    "${cartController.cartitems[index].itemsprice}",
                                numberOfItem:
                                    "${cartController.cartitems[index].countitems}",
                                addToCart: () async {
                                  await cartController.addToCart(
                                      cartController.cartitems[index].itemsId!);
                                  cartController.refreshpage();
                                },
                                removerFromCart: () async {
                                  await cartController.removeFromCart(
                                      cartController.cartitems[index].itemsId!);
                                  cartController.refreshpage();
                                },
                              ))
                    ],
                  ),
                );
              },
            )));
  }
}
