import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class TestData{
  Crud crud;
  TestData(this.crud);
  getData()async{
    var response=await crud.postData(AppLinks.testlink, {});
   return  response.fold((l) => l, (r) => r);
  }
}