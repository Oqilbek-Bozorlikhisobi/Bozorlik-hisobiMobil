import 'package:bozorlik/db/cache.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'common/values/app_infos.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppInfo.init();
  await initializeCache();

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
