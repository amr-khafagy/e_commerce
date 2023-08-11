import 'package:ecommerce/controller/orders/pendingorders.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

requrstNotificationPermission() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshNotification(message.data);
  });
}

refreshNotification(data) {
  if (Get.currentRoute == "/Orders" && data["pagename"] == "refreshpending") {
    PendingOrdersController controller = Get.find();
    controller.refreshorders();
  }
}
