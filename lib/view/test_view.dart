import 'package:ecommerce/controller/test_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
        appBar: AppBar(
          title:const Text("Tittle"),
          backgroundColor: AppColor.primarycolor,
        ),
        body: GetBuilder<TestController>(builder: (controller) {
        return  HandlingDataView(
              statuesRequest: controller.statuesRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return Text("${controller.data}");
                  }));
        }));
  }
}
