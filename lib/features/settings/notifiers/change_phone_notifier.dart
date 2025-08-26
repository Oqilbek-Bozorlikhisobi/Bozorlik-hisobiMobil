import 'dart:async';
import 'package:bozorlik/features/auth/models/otp_state.dart';
import 'package:bozorlik/features/auth/notifiers/register_otp_notifier.dart';
import 'package:bozorlik/features/settings/notifiers/profile_notifier.dart';
import 'package:bozorlik/features/settings/repositories/profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_phone_notifier.g.dart';

@riverpod
class ChangePhoneNotifier extends _$ChangePhoneNotifier {
  Timer? _timer;
  static const _resendCooldown = 60;

  @override
  OtpNotifierState build() {
    return const OtpNotifierState();
  }

  Future<void> verifyOtp({required OtpState model}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await profileRepository.verifyOtpForChanging(
        state: model,
      );
      state = state.copyWith(isLoading: false, result: response);
      ref.invalidate(profileNotifierProvider);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: "invalid_otp".tr());
    }
  }

  Future<String?> sendOtp({required String phoneNumber}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await profileRepository.sendOtpForChanging(
        phone: phoneNumber,
      );

      startResendTimer();
      if (response != null) {
        state = state.copyWith(isLoading: false);
        return response;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: "failed_to_send_otp".tr(),
        );
      }
      return response;
    } catch (e) {
      if (e is DioException) {
        state = state.copyWith(
          isLoading: false,
          error:
              e.response?.statusCode == 409
                  ? "user_already_exist".tr()
                  : "failed_to_send_otp".tr(),
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          error: "failed_to_send_otp".tr(),
        );
      }
    }
    return null;
  }

  void startResendTimer() {
    _timer?.cancel();
    state = state.copyWith(resendAvailableIn: _resendCooldown);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final current = state.resendAvailableIn;
      if (current <= 1) {
        timer.cancel();
        state = state.copyWith(resendAvailableIn: 0);
      } else {
        state = state.copyWith(resendAvailableIn: current - 1);
      }
    });
  }

  Future<String?> resendOtp({required String phone}) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      print("phone: $phone");
      final response = await profileRepository.resendOtpForChanging(
        phone: phone,
      );
      startResendTimer();
      if (response != null) {
        state = state.copyWith(isLoading: false);
        return response;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: "failed_to_send_otp".tr(),
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: "failed_to_send_otp".tr(),
      );
    }
    return null;
  }
}
