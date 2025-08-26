// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterState _$RegisterStateFromJson(Map<String, dynamic> json) =>
    _RegisterState(
      fullName: json['fullName'] as String?,
      region: json['region'] as String?,
      gender: json['gender'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
    );

Map<String, dynamic> _$RegisterStateToJson(_RegisterState instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'region': instance.region,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
    };
