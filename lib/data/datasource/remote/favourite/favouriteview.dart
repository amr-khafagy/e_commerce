
import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class FavouriteViewData {
  Crud crud;

  FavouriteViewData(this.crud);

  getFavouriteData(String id) async {
    var response = await crud.postData(AppLinks.favouriteview, {
      "id": id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
  deltefromdata(String id)async{
    var response=await crud.postData(AppLinks.removeFromFavourite, {
      "id":id.toString(),
    });

    return  response.fold((l) => l, (r) => r);
  }
}