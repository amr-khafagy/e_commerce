import 'package:ecommerce/controller/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/validinput.dart';
import 'package:ecommerce/view/widget/login/bodytextauth.dart';
import 'package:ecommerce/view/widget/login/buttonauth.dart';
import 'package:ecommerce/view/widget/login/textformfieldauth.dart';
import 'package:ecommerce/view/widget/login/tittletextauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllIMP controller = Get.put(ResetPasswordControllIMP());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "35".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Form(
        key: controller.formstate,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TittleTextAuth(
                  tittletext: "35".tr,
                ),
                BodyTextAuth(
                  bodytextauth: "34".tr,
                ),
                GetBuilder<ResetPasswordControllIMP>(builder: (context)=>TextFormFieldAuth(
                  isshowpassword: controller.isshowpassword,
                  ontab: () {
                    controller.showpassword();
                  },
                  showicon: Icons.remove_red_eye,
                  keyboardtype: TextInputType.visiblePassword,
                  valid: (value) {
                    return validinput(value!, 5, 40, "password");
                  },
                  authcontroller: controller.newpassword,
                  textlabelauth: "19".tr,
                  suffixiconauth: Icons.password,
                  hinttextauth: "13".tr,
                ),),
                GetBuilder<ResetPasswordControllIMP>(builder: (context)=>TextFormFieldAuth(
                  isshowpassword: controller.isshowpassword,
                  ontab: () {
                    controller.showpassword();
                  },
                  showicon: Icons.remove_red_eye,
                  keyboardtype: TextInputType.visiblePassword,
                  valid: (value) {
                    return validinput(value!, 5, 30, "password");
                  },
                  authcontroller: controller.confirmnewpassword,
                  textlabelauth: "Re ${"13".tr}",
                  suffixiconauth: Icons.password,
                  hinttextauth: "19".tr,
                ),),
                ButtonAuth(
                  buttontext: "33".tr,
                  onpressed: () {
                    controller.gotosuccessresetpassword();
                  },
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
