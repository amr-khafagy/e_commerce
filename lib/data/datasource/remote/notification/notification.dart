import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class NotificationData {
  Crud crud;

  NotificationData(this.crud);
  notification(String userid)async{
    var response=await crud.postData(AppLinks.notification, {
      "userid":userid.toString(),
    });

    return  response.fold((l) => l, (r) => r);
  }
}
