import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class LoginData {
  Crud crud;

  LoginData({required this.crud});

  postData(String password, String email) async {
    var response = await crud.postData(AppLinks.login, {
      "password":password,
      "email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
