import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> getDeviceInfo() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission();
  String? token;
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    token = await messaging.getToken();
    print('Device Token: $token');
  } else {
    print('Push notificationga ruxsat berilmadi');
  }
}
