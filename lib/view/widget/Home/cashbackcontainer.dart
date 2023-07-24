import 'package:ecommerce/controller/home/homecontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CashBackContainer extends GetView<HomeControllerIMP> {
  final String tittle;
  final String body;
  const CashBackContainer({Key? key, required this.tittle, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.primarycolor,
            ),
            height: 150,
            child:  ListTile(
              title: Text(tittle,
                  style:const TextStyle(fontSize: 20,color: Colors.white)),
              subtitle:
              Text(body, style: TextStyle(fontSize: 30,color: Colors.white)),
            ),
          ),
          Positioned(
            top: -20,
            right:controller.lang=="en"?-20:null,
            left:controller.lang=="ar"?-20:null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.grey,
                  borderRadius: BorderRadius.circular(160)),
            ),
          )
        ],
      ),
    );
  }
}
