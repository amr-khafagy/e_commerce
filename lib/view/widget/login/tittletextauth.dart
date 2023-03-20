import 'package:flutter/material.dart';

class TittleTextAuth extends StatelessWidget {
  final String tittletext;
  const TittleTextAuth({Key? key, required this.tittletext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      tittletext,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
