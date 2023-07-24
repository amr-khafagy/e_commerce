import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class ItemsData{
  Crud crud;
  ItemsData(this.crud);
  getData(String id,String userid)async{
    var response=await crud.postData(AppLinks.items, {
      "id":id.toString(),
      "userid":userid.toString(),
    });

    return  response.fold((l) => l, (r) => r);
  }
}