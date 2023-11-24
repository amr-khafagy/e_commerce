import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders/orders.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OrderArchieveController extends GetxController {
  List<OrdersModel> ordersList = [];
  StatuesRequest statuesRequest = StatuesRequest.none;
  MyServices myServices = Get.find();
  OrdersData orders = OrdersData(Get.find());

  getOrders() async {
    ordersList.clear();
    statuesRequest = StatuesRequest.loading;
    print("=========${myServices.sharedPreferences.getString("id")}==========");
    var response = await orders
        .ordersArchieveData(myServices.sharedPreferences.getString("id")!);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        ordersList.addAll(listdata.map((e) => OrdersModel.fromJson((e))));
      } else {
        statuesRequest = StatuesRequest.failure;
      }
      update();
    }
  }

  String ordersType(String val) {
    if (val == "0") {
      return "116".tr;
    } else {
      return "117".tr;
    }
  }

  String paymentmethod(String val) {
    if (val == "0") {
      return "118".tr;
    } else {
      return "119".tr;
    }
  }

  String ordersStatues(String val) {
    if (val == "0") {
      return "120".tr;
    } else if (val == "1") {
      return "121".tr;
    } else if (val == "2") {
      return "122".tr;
    } else if (val == "3") {
      return "123".tr;
    } else {
      return "124".tr;
    }
  }

  submitRating(String ordersid, double rating, String comment) async{
    ordersList.clear();
    statuesRequest = StatuesRequest.loading;
    update();
    var response =await orders.ordersrating(ordersid, rating.toString(), comment);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        getOrders();
      } else {
        statuesRequest = StatuesRequest.failure;
      }
    }
    update();
  }

  refreshorders() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
