import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bozorlik/db/cache.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'common/values/app_infos.dart';
import 'firebase_options.dart';
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
void main() async {
  FlutterError.onError = (details) {
    print('🔴 FLUTTER ERROR:');
    print(details.exception);
    print(details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await EasyLocalization.ensureInitialized();
  await AppInfo.init();
  await initializeCache();

  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        icon: 'resource://drawable/applogo',
        // bu yerda small icon resursi,
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Bildirishnomalar',
        defaultColor: Colors.white,
        ledColor: Colors.white,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
    ],
  );
  AwesomeNotifications().setGlobalBadgeCounter(0);

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: [Locale('uz'), Locale('ru'), Locale('en')],
        startLocale: Locale('uz'),
        saveLocale: true,
        path: 'assets/translations',
        child: const App(),
      ),
    ),
  );
}
