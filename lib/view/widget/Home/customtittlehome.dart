import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTittleHome extends StatelessWidget {
  final String tittle;
  const CustomTittleHome({Key? key, required this.tittle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.symmetric(vertical:20),
      child: Text(tittle,
          style:const TextStyle(
              fontSize: 20,
              color: AppColor.primarycolor,
              fontWeight: FontWeight.bold)),
    );
  }
}
