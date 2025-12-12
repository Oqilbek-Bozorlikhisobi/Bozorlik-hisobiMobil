import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint("backgroundHandler:");
  debugPrint(message.data.toString());
  debugPrint(message.notification?.title ?? "");

}
class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true ,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        debugPrint('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        debugPrint('user granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        debugPrint('user denied permission');
      }
    }
  }
  Future<String?> getDeviceToken() async {
    try {
      if (Platform.isIOS) {
        String? apnsToken = await messaging.getAPNSToken();
        if (apnsToken == null) {
          for (int i = 0; i < 3; i++) {
            await Future.delayed(const Duration(seconds: 1));
            apnsToken = await messaging.getAPNSToken();
            if (apnsToken != null) break;
          }
        }
        if (apnsToken != null) {
          String? token = await messaging.getToken();
          if (kDebugMode) {
            debugPrint('Device token: $token');
          }
          return token;
        } else {
          if (kDebugMode) {
            debugPrint("APNS token hali ham mavjud emas");
          }
          return null;
        }
      } else {
        String? token = await messaging.getToken();
        if (kDebugMode) {
          debugPrint('Device token: $token');
        }
        return token;
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint("Token olishda xato: $e");
      }
      return null;
    }
  }
}

class PushNotificationHelper {
  static String fcmToken = "";
  static Future<void> initialized() async {
    await Firebase.initializeApp();

    if (Platform.isAndroid) {
      NotificationHelper.initialized();
    } else if (Platform.isIOS) {
      FirebaseMessaging.instance.requestPermission();
    }
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    getDeviceTokenToSendNotification();

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      debugPrint("FirebaseMessaging.instance.getInitialMessage");

      if (message != null) {
        debugPrint("New Notification");
        debugPrint(message.data.toString());
        debugPrint(message.notification?.title ?? "");
      }
    });

    FirebaseMessaging.onMessage.listen((message) {
      debugPrint("FirebaseMessaging.onMessage.listen");
      if (message.notification != null) {
        debugPrint(message.notification!.title);
        debugPrint(message.notification!.body);
        debugPrint("${message.data}");

        if (Platform.isAndroid) {
          NotificationHelper.displayNotification(message);
        }
        if (Platform.isIOS) {
          NotificationHelper.displayNotification(message);
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint("FirebaseMessaging.onMessageOpenedApp.listen");
      if (message.notification != null) {
        debugPrint(message.notification!.title);
        debugPrint(message.notification!.body);
        debugPrint("${message.data}");

      }
    });

    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
  }

  static Future<String> getDeviceTokenToSendNotification() async {
    fcmToken = (await FirebaseMessaging.instance.getToken()).toString();
    debugPrint("FCM Token: $fcmToken");

    return fcmToken;
  }
}

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void initialized() {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings("@mipmap/ic_launcher_round");

    flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(android: initializationSettingsAndroid),
        onDidReceiveNotificationResponse: (details) {
          debugPrint(details.toString());
          debugPrint("localBackgroundHandler :");
          debugPrint(details.notificationResponseType ==
              NotificationResponseType.selectedNotification
              ? "selectedNotification"
              : "selectedNotificationAction");
          debugPrint(details.payload);

          try {
          } catch (e) {
            debugPrint("$e");
          }
        }, onDidReceiveBackgroundNotificationResponse: localBackgroundHandler);
  }

  static void displayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
            "push_notification_demo", "push_notification_demo_channel",
            importance: Importance.max, priority: Priority.high),
      );

      await flutterLocalNotificationsPlugin.show(
          id,
          message.notification!.title,
          message.notification!.body,
          notificationDetails,
          payload: json.encode(message.data));
    } on Exception catch (e) {
      debugPrint("$e");
    }
  }
}

Future<void> localBackgroundHandler(NotificationResponse data) async {
  debugPrint(data.toString());
  debugPrint("localBackgroundHandler :");
  debugPrint(data.notificationResponseType ==
      NotificationResponseType.selectedNotification
      ? "selectedNotification"
      : "selectedNotificationAction");
  debugPrint(data.payload);

  try {
  } catch (e) {
    debugPrint("$e");
  }
}



