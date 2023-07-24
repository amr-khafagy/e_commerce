import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/data/model/itemmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
}

class ProductDetailsControllerIMP extends ProductDetailsController {
  late ItemsModel itemsModel;
  late StatuesRequest statuesRequest;
  CartControllerIMP cartController = Get.put(CartControllerIMP());
   int countitems=0   ;

  @override
  initialData() async {
    statuesRequest = StatuesRequest.loading;
    itemsModel = Get.arguments["itemsmodel"];
    countitems = await cartController.countOfCartItems(itemsModel.itemsId!);
    statuesRequest = StatuesRequest.success;
    update();
  }
void add(){
  cartController.addToCart(itemsModel.itemsId!);
    countitems++;
    update();
}
void remove(){
cartController.removeFromCart(itemsModel.itemsId!);
  if(countitems>0){
      countitems--;
      update();

  }
  }
  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
