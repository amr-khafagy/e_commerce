import 'package:ecommerce/controller/address/completeadding.dart';
import 'package:ecommerce/core/function/validinput.dart';
import 'package:ecommerce/view/widget/login/buttonauth.dart';
import 'package:ecommerce/view/widget/login/textformfieldauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteAdding extends StatelessWidget {
  const CompleteAdding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CompleteAddingController());
    return GetBuilder<CompleteAddingController>(builder: (completeAddingController) {
      return Scaffold(
          appBar: AppBar(
            title:Text("96".tr),
          ),
          body: Padding(
              padding: const EdgeInsets.all(15),
              child:  ListView(
                  children: [
                    TextFormFieldAuth(
                        textlabelauth: "97".tr,
                        suffixiconauth: Icons.location_city_outlined,
                        hinttextauth: "98".tr,
                        authcontroller: completeAddingController.city,
                        valid: (val) {
                          validinput(val!,3, 100, "name");
                          return null;
                        },
                        keyboardtype: TextInputType.text),
                    TextFormFieldAuth(
                        textlabelauth: "99".tr,
                        suffixiconauth: Icons.streetview_outlined,
                        hinttextauth: "100".tr,
                        authcontroller: completeAddingController.street,
                        valid: (val) {
                          validinput(val!,3, 100, "name");
                          return null;
                        },
                        keyboardtype: TextInputType.text),
                    TextFormFieldAuth(
                        textlabelauth: "101".tr,
                        suffixiconauth: Icons.drive_file_rename_outline,
                        hinttextauth: "102".tr,
                        authcontroller: completeAddingController.name,
                        valid: (val) {
                          validinput(val!,3, 100, "name");
                          return null;
                        },
                        keyboardtype: TextInputType.text),
                    ButtonAuth(
                      buttontext: "103".tr,
                      onpressed: () {
                        completeAddingController.addAddress();
                      },
                    )
                  ],
                ),)
          );
    });
  }
}
