import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/items/itemsdata.dart';
import 'package:ecommerce/data/model/itemmodel.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();

  getItem(String categoryid);

  changeCat(int val, String catval);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerIMP extends ItemsController {
  List categories = [];
  int? selectedcat;
  List items = [];
  String? catid;
  MyServices myServices=Get.find();
  late StatuesRequest statuesRequest;
  ItemsData itemsData = ItemsData(Get.find());

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  getItem(categoryid) async {
    items.clear();
    statuesRequest = StatuesRequest.loading;
    print("=========${myServices.sharedPreferences.getString("id")}==========");
    var response = await itemsData.getData(categoryid,myServices.sharedPreferences.getString("id")!);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        statuesRequest = StatuesRequest.failure;
      }
      update();
    }
  }

  @override
  changeCat(int val, catval) {
    selectedcat = val;
    catid = catval;
    getItem(catid!);
    update();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedcat = Get.arguments['selectedcategory'];
    catid = Get.arguments['catid'];
    getItem(catid!);
  }
  @override
  goToProductDetails(ItemsModel itemsModel) {
   Get.toNamed(AppRoutes.productDetails,arguments: {"itemsmodel":itemsModel});
  }
}
