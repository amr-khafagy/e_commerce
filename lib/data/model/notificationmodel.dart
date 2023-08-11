class NotificationModel {
  String? notificationId;
  String? notificationTitle;
  String? notificationBody;
  String? notificationUserid;
  String? notificationDate;

  NotificationModel(
      {this.notificationId,
        this.notificationTitle,
        this.notificationBody,
        this.notificationUserid,
        this.notificationDate});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationUserid = json['notification_userid'];
    notificationDate = json['notification_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification_id'] = notificationId;
    data['notification_title'] = notificationTitle;
    data['notification_body'] = notificationBody;
    data['notification_userid'] = notificationUserid;
    data['notification_date'] = notificationDate;
    return data;
  }
}