import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class SignUpData {
  Crud crud;

  SignUpData({required this.crud});

  postData(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLinks.signup, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone
    });
    print(username);
    return response.fold((l) => l, (r) => r);
  }
}
