import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/home/home_data.dart';
import 'package:ecommerce/data/datasource/remote/offers.dart';
import 'package:ecommerce/data/model/itemmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  List data = [];
  HomeData homeData = HomeData(Get.find());
  bool isSearch = false;
  TextEditingController? search;
  StatuesRequest statuesRequest = StatuesRequest.none;
  List<ItemsModel> listItems = [];
  OffersData offersData = OffersData(Get.find());

  checkSearch(val) {
    if (val == "") {
      statuesRequest = StatuesRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    getSearchedData();
    update();
  }

  @override
  goToFavourite() {
    Get.toNamed(AppRoutes.favourite);
  }

  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsmodel": itemsModel});
  }

  getSearchedData() async {
    statuesRequest = StatuesRequest.loading;
    listItems.clear();
    var response = await homeData.searchitems(search!.text);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        List responseData = await response['data'];
        print(response);
        listItems.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

  getItem() async {
    statuesRequest = StatuesRequest.loading;
    var response = await offersData.getData();
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statuesRequest = StatuesRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    search = TextEditingController();
    getSearchedData();
    getItem();
    super.onInit();
  }
}
