import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: Get.width / 3,
          color: AppColor.primarycolor,
        ),
        Positioned(
            top: Get.width / 3.9,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              padding: const EdgeInsets.all(4),
              child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                  backgroundColor: AppColor.grey),
            )),
      ],
    );
  }
}
