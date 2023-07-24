import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class CheckemailData {
  Crud crud;

  CheckemailData({required this.crud});

  postData(String email) async {
    var response = await crud.postData(AppLinks.checkemail, {
      "email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
