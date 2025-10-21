import 'package:bozorlik/app/router.dart';
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/utils/theme/theme_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class App extends StatelessWidget {
  const App({super.key});

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