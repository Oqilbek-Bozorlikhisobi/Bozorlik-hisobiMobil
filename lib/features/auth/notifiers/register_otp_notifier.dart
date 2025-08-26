import 'dart:async';
import 'package:bozorlik/features/auth/models/otp_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/login_response.dart';
import '../repositories/auth_repository.dart';

part 'register_otp_notifier.g.dart';

part 'register_otp_notifier.freezed.dart';

@Freezed()
abstract class OtpNotifierState with _$OtpNotifierState {
  const factory OtpNotifierState({
    @Default(false) bool? isLoading,
    LoginResponse? result,
    String? error,
    @Default(60) int resendAvailableIn,
  }) = _OtpNotifierState;

  factory OtpNotifierState.fromJson(Map<String, Object?> json) =>
      _$OtpNotifierStateFromJson(json);
}

@riverpod
class RegisterOtpNotifier extends _$RegisterOtpNotifier {
  Timer? _timer;
  static const _resendCooldown = 60;

  @override
  OtpNotifierState build() {
    return const OtpNotifierState();
  }

  Future<void> verifyOtp({required OtpState model}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await authRepository.verifyOtp(state: model);
      state = state.copyWith(isLoading: false, result: response);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: "Invalid OTP");
    }
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

  Future<String?> resendOtp({required OtpState model}) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await authRepository.sendOtp(state: model);
      startResendTimer();
      if (response != null) {
        state = state.copyWith(isLoading: false);
        return response;
      } else {
        state = state.copyWith(isLoading: false, error: "Failed to send OTP");
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: "Failed to send OTP");
    }
    return null;
  }
}
