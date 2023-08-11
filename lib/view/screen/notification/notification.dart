import 'package:ecommerce/controller/notification/notificationcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      body:
          GetBuilder<NotificationController>(builder: (notificationcontroller) {
        return HandlingDataView(
            statuesRequest: notificationcontroller.statuesRequest,
            widget: ListView.builder(
              itemCount: notificationcontroller.notificationList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(notificationcontroller
                        .notificationList[index].notificationTitle!),
                    subtitle: Text(notificationcontroller
                        .notificationList[index].notificationBody!),
                    trailing: Text(Jiffy(
                      notificationcontroller
                          .notificationList[index].notificationDate!,
                    "yyyy-mm-dd").fromNow()),
                  ),
                );
              },
            ));
      }),
    );
  }
}
