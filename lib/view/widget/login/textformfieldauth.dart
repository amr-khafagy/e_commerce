import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldAuth extends StatelessWidget {
  final String textlabelauth;
  final IconData suffixiconauth;
  final String hinttextauth;
  final TextEditingController authcontroller;
  final String? Function(String?) valid;
  final TextInputType keyboardtype;
  final bool? isshowpassword;
  final void Function()? ontab;
  final IconData? showicon;

  const TextFormFieldAuth(
      {Key? key,
      this.showicon,
      this.isshowpassword,
      this.ontab,
      required this.textlabelauth,
      required this.suffixiconauth,
      required this.hinttextauth,
      required this.authcontroller,
      required this.valid,
      required this.keyboardtype})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(top: 10.h, bottom: 10.h),
      child: TextFormField(
        obscureText:
            isshowpassword == null || isshowpassword == false ? false : true,
        decoration: InputDecoration(
            hintText: hinttextauth,
            label: Text(
              textlabelauth,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            prefixIcon: IconButton(icon: Icon(showicon), onPressed: ontab),
            suffixIcon: Icon(suffixiconauth)),
        controller: authcontroller,
        validator: valid,
        keyboardType: keyboardtype,
      ),
    );
  }
}
