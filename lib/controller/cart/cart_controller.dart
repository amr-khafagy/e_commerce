import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart/cartdata.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  countOfCartItems(String itemsid);

  addToCart(String itemsid);

  removeFromCart(String itemsid);
}

class CartControllerIMP extends CartController {
  TextEditingController couponController = TextEditingController();
  int discountCoupon = 0;
  String? couponCode;
  String? couponId;
  Map iscart = {};
  MyServices myServices = Get.find();
  late StatuesRequest statuesRequest;
  CartData cartData = CartData(Get.find());
  List<CartModel> cartitems = [];
  int totalItems = 0;
  double priceitems = 0.0;
  late CartModel cartModel;
  late CouponModel couponModel;

  @override
  addToCart(String itemsid) async {
    cartitems.clear();
    statuesRequest = StatuesRequest.loading;
    var response = await cartData.addToCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            titleText: Text("59".tr,
                style: const TextStyle(color: AppColor.favoritecolor)),
            messageText: Text(
              "60".tr,
              style: const TextStyle(color: AppColor.primarycolor),
            ),
            icon: const Icon(
              Icons.add_shopping_cart_outlined,
              color: AppColor.favoritecolor,
              size: 25,
            ),
            backgroundColor: AppColor.backgroundcolor);
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

  returnDiscount() {
    return (priceitems - priceitems * discountCoupon / 100);
  }

  @override
  removeFromCart(String itemsid) async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await cartData.deletFromCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            titleText: Text("59".tr,
                style: const TextStyle(color: AppColor.favoritecolor)),
            messageText: Text(
              "61".tr,
              style: const TextStyle(color: AppColor.primarycolor),
            ),
            icon: const Icon(
              Icons.remove_shopping_cart_outlined,
              color: AppColor.favoritecolor,
              size: 25,
            ),
            backgroundColor: AppColor.backgroundcolor);
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

  @override
  countOfCartItems(String itemsid) async {
    statuesRequest = StatuesRequest.loading;
    var response = await cartData.countOfCartItems(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == 'success') {
        int countItem = 0;
        countItem = int.parse(response['data']);

        return countItem;
      } else {
        StatuesRequest.failure;
      }
    }
  }

  getCartItems() async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await cartData
        .viewCartItems(myServices.sharedPreferences.getString("id")!);
    statuesRequest = handlingData(response);
    print("===========${response["status"].toString()}===========");
    print("===========${statuesRequest.toString()}===========");
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == 'success') {
        List? dataResponse = response['data'];
        cartitems.clear();
        cartitems.addAll(dataResponse!.map((e) => CartModel.fromJson(e)));
      } else {
        StatuesRequest.failure;
      }
    }
    update();
  }
  geCountPrice() async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await cartData
        .viewCartItems(myServices.sharedPreferences.getString("id")!);
    statuesRequest = handlingData(response);
    print("===========${response["status"].toString()}===========");
    print("===========${statuesRequest.toString()}===========");
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == 'success') {

        Map? dataResponseCountPrice = response['data'] as Map<dynamic,dynamic>;
        print("##########${dataResponseCountPrice}");
        totalItems=dataResponseCountPrice!["totalprice"];


      } else {
        StatuesRequest.failure;
      }
    }
    update();
  }
  getCoupon() async {
    update();
    var response = await cartData.coupon(couponController.text);
    print(response);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == 'success') {
        Map<String, dynamic> dataCoupon = response['data'];
        couponModel = CouponModel.fromJson(dataCoupon);
        discountCoupon = int.parse(couponModel.couponDiscount!);
        couponCode = couponModel.couponName;
        couponId = couponModel.couponId;
      } else {
        discountCoupon = 0;
        couponCode = null;
        couponId = null;
      }
    }
    update();
  }

  gotoOrders() {
    if (cartitems.isEmpty) return Get.snackbar("Warning", "Cart is empty");
    Get.toNamed(AppRoutes.checkOut, arguments: {
      "couponid": couponId ?? "0",
      "priceitems": priceitems.toString(),
      "coupondiscount": discountCoupon,
    });
  }

  resetVarCart() {
    totalItems = 0;
    priceitems = 0.0;
    cartitems.clear();
  }

  refreshpage() {
    resetVarCart();
    getCartItems();
  }

  @override
  void onInit() {
    getCartItems();
    couponController = TextEditingController();
    getCoupon();
    geCountPrice();
    refreshpage();
    super.onInit();
  }
}
