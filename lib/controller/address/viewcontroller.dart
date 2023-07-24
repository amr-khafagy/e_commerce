import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address/completeadding.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

class ViewController extends GetxController {
  StatuesRequest statuesRequest = StatuesRequest.loading;
  Addingaddress addingaddress = Addingaddress(Get.find());
  List<AddressModel> data = [];
  MyServices myServices = Get.find();
  deleteAddress(String addressid){
  addingaddress.deleteaddress(addressid);
  data.removeWhere((element) => element.addressId==addressid);
  update();
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
        if(data.isEmpty){
          statuesRequest=StatuesRequest.failure;
        }
      } else {
        statuesRequest = StatuesRequest.failure;
      }
      update();
    }
  }

  void onInit() {
    getAddress();
    super.onInit();
  }
}
