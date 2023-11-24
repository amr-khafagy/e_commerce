import 'package:ecommerce/controller/address/viewcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:ecommerce/view/widget/cart/cart_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.addressadd);
          },
          child: const Icon(Icons.add)),
      body: GetBuilder<ViewController>(builder: (viewController) {
        return HandlingDataView(
            statuesRequest: viewController.statuesRequest,
            widget: Column(
              children: [
                 CartAppBar(tittle: "104".tr),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewController.data.length,
                    itemBuilder: (context, index) {
                      return ViewAddressCard(
                        addressModel: viewController.data[index],
                        onDelete: () {
                          Get.defaultDialog(
                              title: "Warning",
                              middleText: "Do You Want To Delete This Address",
                              onConfirm: () {
                                viewController.deleteAddress(
                                    viewController.data[index].addressId!);
                              });
                        },
                      );
                    }),
              ],
            ));
      }),
    );
  }
}

class ViewAddressCard extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;

  const ViewAddressCard(
      {super.key, required this.addressModel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text("${addressModel.addressName}"),
          subtitle: Text("${addressModel.addressCity}"),
          trailing:
              IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
        ),
      ),
    );
  }
}
