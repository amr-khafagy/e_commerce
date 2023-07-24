import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class VerifyCodeSignUpData {
  Crud crud;

  VerifyCodeSignUpData({required this.crud});

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLinks.verifycodeSignup, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
  resenddata(String email) async {
    var response = await crud.postData(AppLinks.resendcode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
