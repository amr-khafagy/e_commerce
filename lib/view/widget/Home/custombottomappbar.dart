import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData iconData;
  final String textButton;
  final bool? active;

  const CustomBottomAppBar(
      {Key? key,
    required this.onPressed,
      required this.iconData,
      required this.active,
      required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ? AppColor.primarycolor : AppColor.black,
          ),
          Text(
            textButton,
            style: TextStyle(
                color: active == true ? AppColor.primarycolor : AppColor.black),
          )
        ],
      ),
    );
  }
}
