import 'package:ecommerce/controller/setting/setting_control.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/screen/setting/settingdivider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ListOfSettings extends StatelessWidget {
  const ListOfSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingcontrollIMP controller = Get.put(SettingcontrollIMP());
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 10.w, vertical: 100.h),
      child: Card(
          child: Column(
        children: [
          ListTile(
            title:  Text("93".tr),
            trailing: Switch(onChanged: (val) {}, value: true),
          ),
          const SettingDivider(),
          ListTile(
            title:  Text("87".tr),
            trailing: const Icon(Icons.location_on_outlined),
            onTap: () {
              Get.toNamed(AppRoutes.addressview);
            },
          ),
          const SettingDivider(),
          ListTile(
            title:  Text("88".tr),
            trailing: const Icon(Icons.card_giftcard),
            onTap: () {
              Get.toNamed(AppRoutes.pending);
            },
          ),
          const SettingDivider(),
          ListTile(
            title:Text("89".tr),
            trailing: const Icon(Icons.card_giftcard_sharp),
            onTap: () {
              Get.toNamed(AppRoutes.archieve);
            },
          ),
          const SettingDivider(),
          ListTile(
            title: Text("90".tr),
            trailing: const Icon(Icons.help_outline_outlined),
            onTap: () {},
          ),
          const SettingDivider(),
          ListTile(
            title:Text("91".tr),
            trailing: const Icon(Icons.phone_callback_outlined),
            onTap: () async{
              await launchUrl(Uri.parse("tel:+01027509759"));
            },
          ),
          const SettingDivider(),
          ListTile(
            title:Text("92".tr),
            trailing: const Icon(Icons.logout_outlined),
            onTap: () {
              controller.logout();
            },
          ),
        ],
      )),
    );
  }
}
