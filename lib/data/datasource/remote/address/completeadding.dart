import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class Addingaddress{
  Crud crud;
  Addingaddress(this.crud);
  getaddress(String userid)async{
    var response=await crud.postData(AppLinks.viewaddress, {
      "addressUserId":userid
    });
    return  response.fold((l) => l, (r) => r);
  }
  addaddress(String userid,String name,String city,String street,String lat,String lang)async{
    var response=await crud.postData(AppLinks.addaddress, {
      "userid":userid,
      "name":name,
      "city":city,
      "street":street,
      "lat":lat,
      "lang":lang
    });
    return  response.fold((l) => l, (r) => r);
  }
  deleteaddress(String addressid)async{
    var response=await crud.postData(AppLinks.deleteaddress, {
      "addressid":addressid
    });
    return  response.fold((l) => l, (r) => r);
  }
  editaddress(String addressid,String name,String city,String street,String lat,String lang)async{
    var response=await crud.postData(AppLinks.editaddress, {
      "addressid":addressid,
      "addressname":name,
      "city":city,
      "street":street,
      "lat":lat,
      "lang":lang
    });
    return  response.fold((l) => l, (r) => r);
  }
}