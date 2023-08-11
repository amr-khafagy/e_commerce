import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home/home_data.dart';
import 'package:ecommerce/data/model/itemmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();

  getData();

  goToItem(List categories, int selectedcategory, String categoryid);

  goToFavourite();
}

class HomeControllerIMP extends HomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  List homeBanner = [];
  late StatuesRequest statuesRequest = StatuesRequest.none;
  String? username;
  String? id;
  String? lang;
  TextEditingController? search;
  bool isSearch = false;
  List<ItemsModel> listItems = [];

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
  initialData() {
    lang = myServices.sharedPreferences.getString("language");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  getDataItems() async {
    statuesRequest = StatuesRequest.loading;
    var response = await homeData.getDataItems();
    print("=============================== Controller ${response['data']} ");
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

  @override
  getHomeBanner() async {
    statuesRequest = StatuesRequest.loading;
    var response = await homeData.getBanner();
    print("=============================== Controller ${response['data']} ");
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        homeBanner.addAll(response['data']);
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

  @override
  getData() async {
    statuesRequest = StatuesRequest.loading;
    var response = await homeData.getDataCategories();
    print("=============================== Controller ${response['data']} ");
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['data']);
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
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

  @override
  goToItem(categories, selectedcategory, categoryid) {
    Get.toNamed(AppRoutes.item, arguments: {
      "categories": categories,
      "selectedcategory": selectedcategory,
      "catid": categoryid
    });
  }

  @override
  goToFavourite() {
    Get.toNamed(AppRoutes.favourite);
  }

  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    search = TextEditingController();
    getHomeBanner();
    getData();
    getDataItems();
    initialData();
    super.onInit();
  }
}
