import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  final void Function()? onpressed;
  final String buttontext;

  const ButtonAuth({Key? key, this.onpressed, required this.buttontext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 10,bottom: 10),
      child: MaterialButton(
        onPressed:onpressed,
        color: AppColor.primarycolor,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Text(
          buttontext,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
