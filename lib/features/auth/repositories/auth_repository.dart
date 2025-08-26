import 'package:bozorlik/features/auth/models/login_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/router.dart';
import '../../../common/helpers/request_helper.dart';
import '../../../db/cache.dart';
import '../models/otp_state.dart';
import '../models/register_state.dart';

class AuthRepository {
  Future<String> initialRoute(WidgetRef ref) async {
    final token = cache.getString("access_token");
    final langCode = cache.getString("language");
    final onboarded = cache.getBool("onboarded");

    if (langCode != null) {
      if (onboarded == null || onboarded == false) {
        return AppRoutes.onboarding;
      }
      if (token != null && isTokenExpired(token) == false) {
        return AppRoutes.main;
      } else {
        return AppRoutes.login;
      }
    } else {
      return AppRoutes.language;
    }
  }

  Future<bool> refreshToken() async {
    try {
      final token = cache.getString("refresh_token");
      final response = await requestHelper.post("/auth/refresh/user", {
        "refreshToken": token,
      });
      final model = LoginResponse.fromJson(response);
      await cache.setString("access_token", model.accessToken ?? "");
      await cache.setString("id", model.user?.id ?? "");
      await cache.setString("refresh_token", model.accessToken ?? "");
      return true;
    } catch (e, s) {
      return false;
    }
  }

  Future<LoginResponse> login({
    required String phone,
    required String password,
  }) async {
    final response = await requestHelper.post("/auth/login/user", {
      "phoneNumber": phone,
      "password": password,
    }, log: true);

    final model = LoginResponse.fromJson(response);

    await cache.setString("access_token", model.accessToken ?? "");
    await cache.setString("id", model.user?.id ?? "");
    await cache.setString("refresh_token", model.accessToken ?? "");

    return model;
  }

  Future<String> register({required RegisterState model}) async {
    final response = await requestHelper.post(
      "/auth/register/user",
      model.toJson(),
    );
    return response["details"];
  }

  Future<LoginResponse> verifyOtp({required OtpState state}) async {
    final response = await requestHelper.post(
      "/auth/verify/otp",
      state.toJson(),
    );
    final model = LoginResponse.fromJson(response);
    await cache.setString("id", model.user?.id ?? "");
    await cache.setString("access_token", model.accessToken ?? "");
    await cache.setString("refresh_token", model.accessToken ?? "");
    return model;
  }

  Future<String?> sendOtp({required OtpState state}) async {
    final response = await requestHelper.post("/auth/sendotp/again", {
      "phoneNumber": state.phoneNumber,
    });

    return response["details"];
  }

  Future<String> forgotPassword({
    required String phoneNumber,
    required String password,
  }) async {
    final response = await requestHelper.post("/auth/forgot/password", {
      "phoneNumber": phoneNumber,
      "newPassword": password,
    });

    return response["details"];
  }

  Future<dynamic> forgotPasswordVerify({required OtpState state}) async {
    final response = await requestHelper.patch(
      "/auth/forget/password/verify-otp",
      state.toJson(),
    );

    return response;
  }
}

final authRepository = AuthRepository();
