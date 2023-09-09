import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favourite/favouritedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class FavouriteController extends GetxController {
  setfavourite(id, val);

  addfavourite(String itemsid);

  removefavourite(String itemsid);
}

class FavouriteControllerIMP extends FavouriteController {
  Map isfavourite = {};
  MyServices myServices = Get.find();
  late StatuesRequest statuesRequest;
  FavouriteData favouriteData = FavouriteData(Get.find());
  List favouriteitems = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  setfavourite(id, val) {
    isfavourite[id] = val;
    update();
  }

  @override
  addfavourite(String itemsid) async {
    favouriteitems.clear();
    statuesRequest = StatuesRequest.loading;
    var response = await favouriteData.addfavourite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            titleText: Text("56".tr,style:const TextStyle(color: AppColor.favoritecolor)),
            messageText: Text("57".tr,style:const TextStyle(color: AppColor.primarycolor),),
            icon:const Icon(
              Icons.favorite,
              color: AppColor.favoritecolor,
              size: 25,
            ),
        backgroundColor:AppColor.backgroundcolor
        );
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
  }

  @override
  removefavourite(String itemsid) async {
    favouriteitems.clear();
    statuesRequest = StatuesRequest.loading;
    var response = await favouriteData.removefavourite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            titleText: Text("56".tr,style:const TextStyle(color: AppColor.favoritecolor)),
            messageText: Text("58".tr,style:const TextStyle(color: AppColor.primarycolor),),
            icon:const Icon(
              Icons.favorite,
              color: AppColor.favoritecolor,
              size: 25,
            ),
            backgroundColor:AppColor.backgroundcolor
        );
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
  }
}
