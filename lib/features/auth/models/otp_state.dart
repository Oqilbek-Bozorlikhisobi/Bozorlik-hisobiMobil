import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

part 'otp_state.g.dart';

@freezed
abstract class OtpState with _$OtpState {
  const factory OtpState({
    @JsonKey(name: 'verification_key') String? verificationKey,
    @JsonKey(name: 'otp') String? otp,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
  }) = _OtpState;

  factory OtpState.fromJson(Map<String, Object?> json) =>
      _$OtpStateFromJson(json);
}
