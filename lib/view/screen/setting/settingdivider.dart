import 'package:flutter/material.dart';

class SettingDivider extends StatelessWidget {
  const SettingDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      endIndent: 2,
      height: .1,
      color: Colors.grey,
    );
  }
}
