// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OtpState _$OtpStateFromJson(Map<String, dynamic> json) => _OtpState(
  verificationKey: json['verification_key'] as String?,
  otp: json['otp'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
);

Map<String, dynamic> _$OtpStateToJson(_OtpState instance) => <String, dynamic>{
  'verification_key': instance.verificationKey,
  'otp': instance.otp,
  'phoneNumber': instance.phoneNumber,
};
