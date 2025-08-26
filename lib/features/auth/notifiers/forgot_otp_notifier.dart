import 'dart:async';
import 'package:bozorlik/features/auth/models/otp_state.dart';
import 'package:bozorlik/features/auth/notifiers/register_otp_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/login_response.dart';
import '../repositories/auth_repository.dart';

part 'forgot_otp_notifier.g.dart';

@riverpod
class ForgotOtpNotifier extends _$ForgotOtpNotifier {
  Timer? _timer;
  static const _resendCooldown = 60;

  @override
  OtpNotifierState build() {
    return const OtpNotifierState();
  }

  Future<void> verifyOtp({required OtpState model}) async {
    print("verifying otp: $model");
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await authRepository.forgotPasswordVerify(state: model);
      state = state.copyWith(isLoading: false, result: LoginResponse());
      print("Verified");
    } catch (e) {
      state = state.copyWith(isLoading: false, error: "Invalid OTP");

      print("NotVerified");
    }
  }

  Future<String> sendOtp({
    required String phoneNumber,
    required String password,
  }) async {
    final response = await authRepository.forgotPassword(
      phoneNumber: phoneNumber,
      password: password,
    );

    startResendTimer();
    return response;
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

  // Future<String?> resendOtp({required OtpState model}) async {
  //   state = state.copyWith(isLoading: true, error: null);
  //
  //   try {
  //     final response = await authRepository.sendOtp(state: model);
  //     startResendTimer();
  //     if (response != null) {
  //       state = state.copyWith(isLoading: false);
  //       return response;
  //     } else {
  //       state = state.copyWith(isLoading: false, error: "Failed to send OTP");
  //     }
  //   } catch (e) {
  //     state = state.copyWith(isLoading: false, error: "Failed to send OTP");
  //   }
  //   return null;
  // }
}
