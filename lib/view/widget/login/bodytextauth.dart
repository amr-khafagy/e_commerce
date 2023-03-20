import 'package:flutter/material.dart';

class BodyTextAuth extends StatelessWidget {
  final String bodytextauth;
  const BodyTextAuth({Key? key, required this.bodytextauth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 10,bottom: 15),
      child: Text(
        bodytextauth,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
