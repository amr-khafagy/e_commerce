import 'package:ecommerce/controller/setting/setting_control.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/screen/setting/settingdivider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOfSettings extends StatelessWidget {
  const ListOfSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingcontrollIMP controller = Get.put(SettingcontrollIMP());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
      child: Card(
          child: Column(
        children: [
          ListTile(
            title: const Text("Disable Notification"),
            trailing: Switch(onChanged: (val) {}, value: true),
          ),
          const SettingDivider(),
          ListTile(
            title: const Text("Address"),
            trailing: const Icon(Icons.location_on_outlined),
            onTap: () {
              Get.offAllNamed(AppRoutes.addressview);
            },
          ),
          const SettingDivider(),
          ListTile(
            title: const Text("About Us"),
            trailing: const Icon(Icons.help_outline_outlined),
            onTap: () {},
          ),
          const SettingDivider(),
          ListTile(
            title: const Text("Contact Us"),
            trailing: const Icon(Icons.phone_callback_outlined),
            onTap: () {},
          ),
          const SettingDivider(),
          ListTile(
            title: const Text("Logout"),
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
