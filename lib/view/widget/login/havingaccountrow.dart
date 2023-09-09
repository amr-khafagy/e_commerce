import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountRow extends StatelessWidget {
  final String text;
  final String inkwelltext;
  final void Function()? ontap;

  const AccountRow(
      {Key? key, required this.text, required this.inkwelltext, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 15.sp, color: AppColor.grey),
          ),
          InkWell(
            onTap: ontap,
            child: Text(inkwelltext,
                style: TextStyle(fontSize:15.sp, color: AppColor.primarycolor)),
          )
        ],
      ),
    );
  }
}
