import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address/completeadding.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CompleteAddingController extends GetxController {
  String? lat;
  String? long;
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  StatuesRequest statuesRequest = StatuesRequest.loading;
  Addingaddress addingaddress = Addingaddress(Get.find());
  List data = [];
  MyServices myServices = Get.find();

  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  addAddress() async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await addingaddress.addaddress(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);
    print("======================Controller $response");
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoutes.homepage);
      }else{
        statuesRequest=StatuesRequest.failure;
      }
      update();
    }
  }

  void onInit() {
    initialData();
    super.onInit();
  }
}
