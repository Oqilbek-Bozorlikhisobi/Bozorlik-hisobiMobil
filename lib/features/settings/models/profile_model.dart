import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';

part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    @JsonKey(name: 'fullName') String? fullName,
    @JsonKey(name: 'region') String? region,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'password') String? password,
    @JsonKey(name: 'confirmPassword') String? confirmPassword,
    @JsonKey(name: 'id') String? id,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?> json) =>
      _$ProfileModelFromJson(json);
}
