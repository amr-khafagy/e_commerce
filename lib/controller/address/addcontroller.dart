import 'dart:async';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  Position? position;
  Completer<GoogleMapController> completerController =
      Completer<GoogleMapController>();
  StatuesRequest statuesRequest = StatuesRequest.loading;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? lat;
  double? long;

  goToCompleteAddress() {
    Get.toNamed(AppRoutes.completeAddress,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  CameraPosition kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(position!.latitude, position!.longitude));
    statuesRequest = StatuesRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }
}
