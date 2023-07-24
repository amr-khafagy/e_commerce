import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
  getData()async{
    var response=await crud.postData(AppLinks.homepage, {});
    return  response.fold((l) => l, (r) => r);
  }
  searchitems(String search)async{
    var response=await crud.postData(AppLinks.searchitems, {
      "search":search.toString(),
    });
    return  response.fold((l) => l, (r) => r);
  }
}