import 'package:ecommerce/controller/address/addcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/login/buttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("ADD Address"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.add)),
        body: Container(
          child:
              GetBuilder<AddAddressController>(builder: (addAddressController) {
            return HandlingDataView(
                statuesRequest: addAddressController.statuesRequest,
                widget: Column(
                  children: [
                    if (addAddressController.kGooglePlex != null)
                      Expanded(
                          child: Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            markers: addAddressController.markers.toSet(),
                            onTap: (latlong) {
                              addAddressController.addMarkers(latlong);
                            },
                            initialCameraPosition:
                                addAddressController.kGooglePlex!,
                            onMapCreated: (GoogleMapController controller) {
                              addAddressController.completerController
                                  .complete(controller);
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            child: ButtonAuth(
                              buttontext: "Complete",
                              onpressed: () {
                                addAddressController.goToCompleteAddress();
                              },
                            ),
                          )
                        ],
                      ))
                  ],
                ));
          }),
        ));
  }
}
