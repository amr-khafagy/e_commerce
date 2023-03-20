import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          InkWell(
            onTap: ontap,
            child: Text(inkwelltext,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColor.primarycolor)),
          )
        ],
      ),
    );
  }
}
