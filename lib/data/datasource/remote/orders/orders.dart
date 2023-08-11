import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/data/datasource/static/applink.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);

  checkOut(
      String userid,
      String addressid,
      String ordertype,
      String priceDelivery,
      String orderPrice,
      String couponId,
      String paymentMethod,
      String coupondiscount) async {
    var response = await crud.postData(AppLinks.checkOut, {
      "userid": userid,
      "addressid": addressid,
      "orderstype": ordertype,
      "pricedelivery": priceDelivery,
      "ordersprice": orderPrice,
      "couponid": couponId,
      "paymentmethod": paymentMethod,
      "coupondiscount": coupondiscount,
    });
    return response.fold((l) => l, (r) => r);
  }

  ordersPendingData(String userid) async {
    var response = await crud.postData(AppLinks.pending, {
      "userid": userid.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }

  ordersDetailsData(String userid) async {
    var response = await crud.postData(AppLinks.orderDetails, {
      "ordersid": userid.toString(),
    });
    print("userid=>$userid");
    return response.fold((l) => l, (r) => r);
  }

  deleteorder(String ordersid) async {
    var response =
        await crud.postData(AppLinks.deleteOrders, {"ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
  ordersArchieveData(String userid) async {
    var response = await crud.postData(AppLinks.archieve, {
      "userid": userid.toString(),
    });

    return response.fold((l) => l, (r) => r);
  }
  ordersrating(String id,String rating,String comment) async {
    var response = await crud.postData(AppLinks.rating, {
      "id": id.toString(),
      "rating":rating.toString(),
      "comment":comment.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
