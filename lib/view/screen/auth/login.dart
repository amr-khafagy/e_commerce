import 'package:ecommerce/controller/auth/login_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/function/appexit.dart';
import 'package:ecommerce/core/function/validinput.dart';
import 'package:ecommerce/view/widget/login/bodytextauth.dart';
import 'package:ecommerce/view/widget/login/buttonauth.dart';
import 'package:ecommerce/view/widget/login/havingaccountrow.dart';
import 'package:ecommerce/view/widget/login/textformfieldauth.dart';
import 'package:ecommerce/view/widget/login/tittletextauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 Get.put(LoginControllIMP());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "9".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
          onWillPop: alertexitapp,
          child: GetBuilder<LoginControllIMP>(builder: (controller) {
            return HandlingDataView(statuesRequest: controller.statuesRequest, widget: Form(
              key: controller.formstate,
              child: SafeArea(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 35.w, vertical: 15.h),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(
                            AppImageAsset.logo,
                            height: 170.h,
                          ),
                          TittleTextAuth(
                            tittletext: "10".tr,
                          ),
                          BodyTextAuth(
                            bodytextauth: "11".tr,
                          ),
                          TextFormFieldAuth(
                            keyboardtype: TextInputType.emailAddress,
                            valid: (value) {
                              return validinput(value!, 5, 40, "email");
                            },
                            authcontroller: controller.email,
                            textlabelauth: "18".tr,
                            suffixiconauth: Icons.email,
                            hinttextauth: "12".tr,
                          ),
                          GetBuilder<LoginControllIMP>(
                            builder: (context) => TextFormFieldAuth(
                                isshowpassword: controller.isshowpassword,
                                ontab: () {
                                  controller.showpassword();
                                },
                                showicon: Icons.remove_red_eye,
                                keyboardtype: TextInputType.visiblePassword,
                                valid: (value) {
                                  return validinput(value!, 4, 50, "password");
                                },
                                authcontroller: controller.password,
                                textlabelauth: "19".tr,
                                suffixiconauth: Icons.password,
                                hinttextauth: "13".tr),
                          ),
                          InkWell(
                            child: Text(
                              "14".tr,
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.end,
                            ),
                            onTap: () {
                              controller.togoforgetpassword();
                            },
                          ),
                          ButtonAuth(
                            buttontext: "26".tr,
                            onpressed: () {
                              controller.login();
                            },
                          ),
                          AccountRow(
                            text: "16".tr,
                            inkwelltext: "17".tr,
                            ontap: () {
                              controller.togosignup();
                            },
                          )
                        ],
                      ),
                    ),
                  )),
            ),
            );
          })),
    );
  }
}
