import 'package:ecommerce/controller/setting/setting_control.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/settings/listofsetting.dart';
import 'package:ecommerce/view/widget/settings/profileimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [ProfileImage(), ListOfSettings()],
        ),
      ),
    );
  }
}
