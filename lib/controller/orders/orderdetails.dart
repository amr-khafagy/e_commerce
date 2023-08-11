import 'dart:async';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/orders/orders.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetailsController extends GetxController {
  late OrdersModel ordersModel;
  CameraPosition? cameraPosition;
  Completer<GoogleMapController>? completerController;
  List<Marker> markers = [];
  double? lat;
  double? lng;
  StatuesRequest statuesRequest = StatuesRequest.loading;
   OrdersData ordersData= OrdersData(Get.find());
  List<CartModel> data = [];

  initialData() {
    if(ordersModel.ordersType=="0"){
      cameraPosition = CameraPosition(
          target: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLang!)),
          zoom: 12.476);
      markers.add(Marker(markerId: const MarkerId("1"),
          position: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLang!))));
    }
  }
  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    initialData();
    getOrderDaetails();
    super.onInit();
  }
  getOrderDaetails() async {
    statuesRequest = StatuesRequest.loading;
    var response = await ordersData
        .ordersDetailsData(ordersModel.ordersId!);
    print("======================Controller $response");
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response["status"] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

}
