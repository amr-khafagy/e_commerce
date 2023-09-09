import 'package:ecommerce/controller/address/completeadding.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/login/buttonauth.dart';
import 'package:ecommerce/view/widget/login/textformfieldauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteAdding extends StatelessWidget {
  const CompleteAdding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CompleteAddingController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Complete Adding Address"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.add)),
        body: Container(
          child: GetBuilder<CompleteAddingController>(
              builder: (completeAddingController) {
            return  Padding(
                  padding: const EdgeInsets.all(15),
                  child: HandlingDataView(statuesRequest: completeAddingController.statuesRequest!, widget:ListView(
                    children: [
                      TextFormFieldAuth(
                          textlabelauth: "City",
                          suffixiconauth: Icons.location_city_outlined,
                          hinttextauth: "City",
                          authcontroller: completeAddingController.city!,
                          valid: (val) {},
                          keyboardtype: TextInputType.text),
                      TextFormFieldAuth(
                          textlabelauth: "Street",
                          suffixiconauth: Icons.streetview_outlined,
                          hinttextauth: "Street",
                          authcontroller: completeAddingController.street!,
                          valid: (val) {},
                          keyboardtype: TextInputType.text),
                      TextFormFieldAuth(
                          textlabelauth: "Name",
                          suffixiconauth: Icons.drive_file_rename_outline,
                          hinttextauth: "Name",
                          authcontroller: completeAddingController.name!,
                          valid: (val) {},
                          keyboardtype: TextInputType.text),
                      ButtonAuth(
                        buttontext: "ADD",
                        onpressed: () {
                          completeAddingController.addAddress();
                        },
                      )
                    ],
                  ),)
                );
          }),
        ));
  }
}
