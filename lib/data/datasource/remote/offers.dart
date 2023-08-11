import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class OffersData{
  Crud crud;
  OffersData(this.crud);
  getData()async{
    var response=await crud.postData(AppLinks.offers, {
    });

    return  response.fold((l) => l, (r) => r);
  }
}