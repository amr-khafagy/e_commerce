import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/notification/notification.dart';
import 'package:ecommerce/data/model/notificationmodel.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<NotificationModel> notificationList = [];
  StatuesRequest statuesRequest = StatuesRequest.none;
  MyServices myServices = Get.find();
  NotificationData notificationData = NotificationData(Get.find());

  getNotification() async {
    notificationList.clear();
    statuesRequest = StatuesRequest.loading;
    var response = await notificationData
        .notification(myServices.sharedPreferences.getString("id")!);
    statuesRequest = handlingData(response);
    if (StatuesRequest.success == statuesRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        notificationList.addAll(listdata.map((e) => NotificationModel.fromJson((e))));
      } else {
        statuesRequest = StatuesRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
   getNotification();
    super.onInit();
  }
}
