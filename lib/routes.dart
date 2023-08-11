import 'package:ecommerce/controller/orders/orderdetails.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/middlware/middlware.dart';
import 'package:ecommerce/view/screen/address/add.dart';
import 'package:ecommerce/view/screen/address/completeadding.dart';
import 'package:ecommerce/view/screen/address/view.dart';
import 'package:ecommerce/view/screen/cart/cart.dart';
import 'package:ecommerce/view/screen/favourite/favourite.dart';
import 'package:ecommerce/view/screen/home/homescreen.dart';
import 'package:ecommerce/view/screen/auth/forgetpassord/checkemail.dart';
import 'package:ecommerce/view/screen/auth/forgetpassord/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassord/successresetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassord/verifycode.dart';
import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/successsignup.dart';
import 'package:ecommerce/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce/view/screen/items/items.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/orders/checkout.dart';
import 'package:ecommerce/view/screen/orders/orderdetails.dart';
import 'package:ecommerce/view/screen/orders/pending.dart';
import 'package:ecommerce/view/screen/productdetails/productdetails.dart';
import 'package:ecommerce/view/screen/selectlanguage.dart';
import 'package:get/get.dart';

import 'view/screen/orders/archieve.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const SelectLanguage(),
      middlewares: [MiddleWare()]),
// GetPage(name: "/", page: ()=>const TestView()),
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
  //Home
  GetPage(name: AppRoutes.homepage, page: () => const HomeScreen()),
  //item
  GetPage(name: AppRoutes.item, page: () => const Items()),
  //productdetails
  GetPage(name: AppRoutes.productDetails, page: () => ProductDetails()),
  //favourite
  GetPage(name: AppRoutes.favourite, page: () => const Favourite()),
  //cart
  GetPage(name: AppRoutes.cart, page: () => const Cart()),
//address
  GetPage(name: AppRoutes.addressview, page: () => const AddressView()),
  GetPage(name: AppRoutes.addressadd, page: () => const AddAddress()),
  GetPage(name: AppRoutes.completeAddress, page: () => const CompleteAdding()),
  //orders
  GetPage(name: AppRoutes.checkOut, page: () => const CheckOut()),
  GetPage(name: AppRoutes.pending, page: () => const Pending()),
  GetPage(name: AppRoutes.orderDetail, page: () => const OrderDetails()),
  GetPage(name: AppRoutes.archieve, page: () => const Archieve()),
];
