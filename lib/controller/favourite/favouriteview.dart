import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favourite/favouriteview.dart';
import 'package:ecommerce/data/model/favouritemodel.dart';
import 'package:ecommerce/data/model/itemmodel.dart';
import 'package:get/get.dart';

abstract class FavouriteViewControll extends GetxController {
  getFavouriteData();
  removeFromFavourite(String favouritid);
}

class FavouriteViewControllIMP extends FavouriteViewControll {
  MyServices myServices = Get.find();
  FavouriteViewData favouriteViewData = FavouriteViewData(Get.find());
  late StatuesRequest statuesRequest = StatuesRequest.none;
  List<FavouritesModel> favouriteItems = [];
 ItemsModel? itemsModel=ItemsModel();
  @override
  getFavouriteData() async {
    statuesRequest = StatuesRequest.loading;
    var response = await favouriteViewData
        .getFavouriteData(myServices.sharedPreferences.getString("id")!);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        favouriteItems
            .addAll(responsedata.map((e) => FavouritesModel.fromJson(e)));
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

  removeFromFavourite(String favouritid) async {
    var response=await favouriteViewData.deltefromdata(favouritid);
    favouriteItems.removeWhere((element) => element.favouriteId==favouritid);
    update();
  }
  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.productDetails,arguments: {"itemsmodel":itemsModel});
  }
  @override
  void onInit() {
    getFavouriteData();
    super.onInit();
  }
}
