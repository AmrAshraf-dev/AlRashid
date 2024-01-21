import 'dart:async';

import 'package:alrashid_mall_app/Views/UI/Profile/purchase_value.dart';
import 'package:alrashid_mall_app/Views/UI/bill/bill_imports.dart';
import 'package:alrashid_mall_app/utils/global_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GlobalNotification {
  static final StreamController<Map<String, dynamic>>
      _onMessageStreamController = StreamController.broadcast();
  static late BuildContext context;

  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  void setupNotification(BuildContext ctx) async {
    context = ctx;

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const android = AndroidInitializationSettings("@mipmap/launcher_icon");
    //const ios = IOSInitializationSettings();
    const initSettings = InitializationSettings(
      android: android,
    );
    _flutterLocalNotificationsPlugin.initialize(
      initSettings,
    );
    await Firebase.initializeApp();
    final settings = await messaging.requestPermission(provisional: true);
    print('User granted permission: ${settings.authorizationStatus}');
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      messaging.getToken().then((token) {
        print("token ====> $token");
      });
      // messaging.setForegroundNotificationPresentationOptions();
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print("_____Message data:${message.data}");
        print("_____notification:${message.notification?.title}");
        _onMessageStreamController.add(message.data);
        //_showLocalNotification(message);
        if (int.parse(message.data["type"]) == 1) {
          GlobalState.instance.set("invoice", message.data["invoice_id"]);
          BuildContext con = GlobalState.instance.get("context");
          Navigator.of(con).push(CupertinoPageRoute(
              builder: (BuildContext con) => PurchaseValue()));
          return;
        } else if (int.parse(message.data["type"]) == 3) {
          print("======type==>>> ${message.data["type"]}");
          print("======confirm==>>> ${message.data["confirm"]}");
          BuildContext con = GlobalState.instance.get("context");
          Navigator.of(con)
              .push(CupertinoPageRoute(builder: (con) => const Bill()));
          return;
        }
      });
      // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //   print('AonMessageOpenedApp event was published!');
      //   flutterNotificationClick(json.encode(message.data));
      // });
      // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    }
  }
}
