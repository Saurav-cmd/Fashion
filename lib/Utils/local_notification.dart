import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings(
                "@mipmap/ic_launcher")); //we can pass icon
    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? routeKey) async {
      //yo onselectnotification le chai app chalda faree popup notification aauxa ne tesma route dine kam garinxa aaba
      if (routeKey != null) {
        if (routeKey == "pricelist") {
          Get.toNamed("Price_List_screen", preventDuplicates: true);
        } else if (routeKey == "scheme") {
          print("ya aayo scheme vhitra");
          Get.toNamed("Scheme_List_screen", preventDuplicates: true);
        } else if (routeKey == "ledger") {
          Get.toNamed("Statement_screen", preventDuplicates: true);
        } else if (routeKey == "notice") {
          Get.toNamed("Notices_screen", preventDuplicates: true);
        } else if (routeKey == "chat") {
          Get.toNamed("Message_screen", preventDuplicates: true);
        } else if (routeKey == "chequeAndDue") {
          Get.toNamed("Profile_screen", preventDuplicates: true);
        } else if (routeKey == "order") {
          Get.toNamed("Order_history_screen", preventDuplicates: true);
        } else if (routeKey == "product") {
          Get.toNamed("store_screen", preventDuplicates: true);
        }
      }
    });
  }

  static display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecond ~/ 1000;
      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails("com.example.pushnotification",
              "com.example.pushnotification channel",
              channelDescription: "This is our channel",
              importance: Importance.max,
              priority: Priority.high));

      //here payload show be described because above inside onSelectNotification we have given route and that data should be initialized in payload other wise we will get null route when tapping the popup notification
      final title = message.notification?.title;
      final body = message.notification?.body;
      await _notificationsPlugin.show(id, title, body, notificationDetails,
          payload: message.data["routeKey"]);
      print("This is notification message payload ${message.data["routeKey"]}");
      // final dataAdded = DatabaseHelper.instance.addNotification(NotificationModel(
      //     title: title,msg: body
      // )
      // );
    } on Exception catch (e) {
      print(e);
      throw e;
    }
  }
}
