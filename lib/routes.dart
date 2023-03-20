import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/middlware/middlware.dart';
import 'package:ecommerce/testfile.dart';
import 'package:ecommerce/view/screen/auth/forgetpassord/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassord/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassord/successresetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassord/verifycode.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/successsignup.dart';
import 'package:ecommerce/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/selectlanguage.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //     name: "/",
  //     page: () => const SelectLanguage(),
  //     middlewares: [MiddleWare()]),
GetPage(name: "/", page: ()=>const Test()),
//onboarding
  GetPage(name: AppRoutes.onboarding, page: () => const OnBoarding()),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(name: AppRoutes.successsignup, page: () => const SucessSignUp()),
  GetPage(
      name: AppRoutes.verifycodesignup, page: () => const VerifyCodeSignUp()),

  //forgetten password
  GetPage(
      name: AppRoutes.successresetpassword,
      page: () => const SucessResetPassword()),
  GetPage(name: AppRoutes.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.resetpassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.verifycode, page: () => const VerifyCode()),
];
