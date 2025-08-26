import 'package:bozorlik/features/auth/pages/forgot_password_page.dart';
import 'package:bozorlik/features/auth/pages/login_page.dart';
import 'package:bozorlik/features/auth/pages/register_page.dart';

import 'package:bozorlik/features/languages/pages/languages_page.dart';
import 'package:bozorlik/features/main/pages/main_page.dart';
import 'package:bozorlik/features/onboarding/pages/onboarding_page.dart';
import 'package:bozorlik/features/products/pages/search_page.dart';
import 'package:go_router/go_router.dart';

import '../features/categories/models/category_model.dart';
import '../features/onboarding/pages/splash_page.dart';
import '../features/products/pages/products_page.dart';
import '../features/settings/pages/change_phone_page.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const language = '/language';
  static const main = '/main';
  static const products = '/products';
  static const forgotPassword = '/forgotPassword';
  static const search = '/search';
  static const changePhone = '/changePhone';
  static const onboarding = '/onboarding';
}

final router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(path: AppRoutes.main, builder: (context, state) => MainPage()),
    GoRoute(path: AppRoutes.login, builder: (context, state) => LoginPage()),
    GoRoute(
      path: AppRoutes.language,
      builder: (context, state) => LanguagesPage(),
    ),
    GoRoute(path: AppRoutes.splash, builder: (context, state) => SplashPage()),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (context, state) => ForgotPasswordPage(),
    ),
    GoRoute(path: AppRoutes.search, builder: (context, state) => SearchPage()),
    GoRoute(
      path: AppRoutes.changePhone,
      builder: (context, state) => ChangePhonePage(),
    ),
    GoRoute(
      path: AppRoutes.products,
      builder: (context, state) {
        final model = state.extra as CategoryModel;
        return ProductsPage(model: model);
      },
    ),
  ],
);
