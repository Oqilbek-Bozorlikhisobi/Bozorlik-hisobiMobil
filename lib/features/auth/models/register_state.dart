import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';
part 'register_state.g.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    @JsonKey(name: 'fullName') String? fullName,
    @JsonKey(name: 'region') String? region,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'confirmPassword') String? confirmPassword,
  }) = _RegisterState;

  factory RegisterState.fromJson(Map<String, Object?> json) => _$RegisterStateFromJson(json);
}

