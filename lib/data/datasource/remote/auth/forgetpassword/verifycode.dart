import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class VerifyCodeData {
  Crud crud;

  VerifyCodeData({required this.crud});

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLinks.verifycode, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}