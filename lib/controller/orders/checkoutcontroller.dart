import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address/completeadding.dart';
import 'package:ecommerce/data/datasource/remote/orders/orders.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  String? paymentMethod;
  String? deliveryType;
  String addressId = "0";
  String? discountcoupon;
  String? couponId;
  String? priceitems;
  StatuesRequest statuesRequest = StatuesRequest.loading;
  Addingaddress addingaddress = Addingaddress(Get.find());
  OrdersData orders = OrdersData(Get.find());
  List<AddressModel> data = [];
  MyServices myServices = Get.find();

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDelivery(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressId = val;
    update();
  }

  checkOut() async {
    if (deliveryType == null) {
      return Get.snackbar("Error", "Select delvierytype");
    }
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Select paymentmethod");
    }
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await orders.checkOut(
      myServices.sharedPreferences.getString("id")!,
      addressId.toString(),
      deliveryType!.toString(),
      "10",
      priceitems!.toString(),
      couponId!.toString(),
      paymentMethod!.toString(),
      discountcoupon!.toString(),
      "0",
      " "
    );
    print("======================Controller ${response}");
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoutes.homepage);
        Get.snackbar("Success", "The orders was successfully");
      } else {
        statuesRequest = StatuesRequest.none;
        Get.snackbar("Warning", "Try Again");
      }
      update();
    }
  }

  getAddress() async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await addingaddress
        .getaddress(myServices.sharedPreferences.getString("id")!);
    print("======================Controller $response");
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response["status"] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statuesRequest = StatuesRequest.failure;
        }
      } else {
        statuesRequest = StatuesRequest.failure;
      }
      update();
    }
  }

  void onInit() {
    getAddress();
    couponId = Get.arguments['couponid'];
    priceitems = Get.arguments['priceitems'];
    discountcoupon = Get.arguments['coupondiscount'].toString();
    super.onInit();
  }
}
