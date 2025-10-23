import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:bozorlik/app/router.dart';
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/utils/notification.dart';
import 'package:bozorlik/utils/theme/theme_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    // Foreground holatda pushni tinglash
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (Platform.isIOS) {
        if (message.notification == null) {
          showAwesomeNotification(message);
        }
      } else {
        showAwesomeNotification(message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {

          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1),
              ),
              child: ToastificationWrapper(
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'MARKET APP',
                  routerConfig: router,

                  // Theme settings
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: state.themeMode, // Bloc dan kelyapti

                  // Localization
                  locale: context.locale,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  // ✅ MUHIM: Har safar yangilanishda AppColors context ni oladi
                  builder: (context, child) {
                    AppColors.setContext(context);
                    return child!;
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}