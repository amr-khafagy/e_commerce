import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cart/cartdata.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  countOfCartItems(String itemsid);

  addToCart(String itemsid);

  removeFromCart(String itemsid);
}

class CartControllerIMP extends CartController {
  TextEditingController couponController=TextEditingController();
  Map iscart = {};
  MyServices myServices = Get.find();
  late StatuesRequest statuesRequest;
  CartData cartData = CartData(Get.find());
  List<CartModel> cartitems = [];
  int totalItems = 0;
  double priceitems = 0.0;
  late CartModel cartModel;

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
    print(response);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == 'success') {
        List dataResponse = response['datacart'];
        Map dataResponseCountPrice = response['countprice'];
        cartitems.clear();
        cartitems.addAll(dataResponse.map((e) => CartModel.fromJson(e)));
        totalItems = int.parse(dataResponseCountPrice['totalcount']);
        priceitems = double.parse(dataResponseCountPrice['totalprice']);
        print(totalItems);
        print(priceitems);
      } else {
        StatuesRequest.failure;
      }
    }
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
    couponController=TextEditingController();
    getCartItems();
    refreshpage();
    super.onInit();
  }
}
