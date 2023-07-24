import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class CartData{
  Crud crud;
  CartData(this.crud);
  addToCart(String userid,String itemsid)async{
    var response=await crud.postData(AppLinks.addToCart, {
      "userid":userid.toString(),
      "itemsid":itemsid.toString(),
    });

    return  response.fold((l) => l, (r) => r);
  }
  deletFromCart(String userid,String itemsid)async {
    var response = await crud.postData(AppLinks.deletFromCart, {
      "userid": userid.toString(),
      "itemsid": itemsid.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }
    countOfCartItems(String userid,String itemsid)async{
      var response=await crud.postData(AppLinks.countOfCartItems, {
        "userid":userid.toString(),
        "itemsid":itemsid.toString(),
      });

      return  response.fold((l) => l, (r) => r);
  }
  viewCartItems(String userid)async{
    var response=await crud.postData(AppLinks.viewCartItems, {
      "userid":userid.toString(),
    });

    return  response.fold((l) => l, (r) => r);
  }
}