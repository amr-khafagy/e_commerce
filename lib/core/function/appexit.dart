import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertexitapp(){
Get.defaultDialog(
  title: "Alert",
  middleText: "Do you want to exit the application",
  actions: [
    ElevatedButton(onPressed: (){
      exit(0);
    }, child:const Text("OK")),
    ElevatedButton(onPressed: (){
      Get.back();
    }, child:const Text("cancel")),
  ]
);
return Future.value(true);
}