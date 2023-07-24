import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class FavouriteData{
  Crud crud;
  FavouriteData(this.crud);
  addfavourite(String userid,String itemsid)async{
    var response=await crud.postData(AppLinks.addfavourite, {
      "userid":userid.toString(),
      "itemsid":itemsid.toString(),
    });

    return  response.fold((l) => l, (r) => r);
  }
  removefavourite(String userid,String itemsid)async{
    var response=await crud.postData(AppLinks.removefavourite, {
      "userid":userid.toString(),
      "itemsid":itemsid.toString(),
    });

    return  response.fold((l) => l, (r) => r);
  }

}