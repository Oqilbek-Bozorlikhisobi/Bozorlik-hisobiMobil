// import 'package:bozorlik/app/router.dart';
// import 'package:bozorlik/app/theme.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:toastification/toastification.dart';
//
// class App extends StatefulWidget {
//   const App({super.key});
//
//   @override
//   State<App> createState() => _AppState();
// }
//
// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: MediaQuery(
//         data: MediaQuery.of(
//           context,
//         ).copyWith(textScaler: const TextScaler.linear(1)),
//         child: ToastificationWrapper(
//           child: MaterialApp.router(
//             debugShowCheckedModeBanner: false,
//             title: 'MARKET APP',
//             routerConfig: router,
//             theme: lightTheme,
//
//             locale: context.locale,
//             localizationsDelegates: context.localizationDelegates,
//             supportedLocales: context.supportedLocales,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:bozorlik/app/router.dart';
import 'package:bozorlik/app/theme.dart';
import 'package:bozorlik/utils/theme/theme_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          AppColors.init(context); // Init qilish

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
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: state.themeMode,
                  locale: context.locale,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}