import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class ResetPasswordlData {
  Crud crud;

  ResetPasswordlData({required this.crud});

  postData(String email,String password) async {
    var response = await crud.postData(AppLinks.resetpassword, {
      "email":email,
      "password":password,
    });
    return response.fold((l) => l, (r) => r);
  }
}