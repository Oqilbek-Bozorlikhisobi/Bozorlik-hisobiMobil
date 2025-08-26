// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_otp_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OtpNotifierState _$OtpNotifierStateFromJson(Map<String, dynamic> json) =>
    _OtpNotifierState(
      isLoading: json['isLoading'] as bool? ?? false,
      result:
          json['result'] == null
              ? null
              : LoginResponse.fromJson(json['result'] as Map<String, dynamic>),
      error: json['error'] as String?,
      resendAvailableIn: (json['resendAvailableIn'] as num?)?.toInt() ?? 60,
    );

Map<String, dynamic> _$OtpNotifierStateToJson(_OtpNotifierState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'result': instance.result,
      'error': instance.error,
      'resendAvailableIn': instance.resendAvailableIn,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registerOtpNotifierHash() =>
    r'0b00c7670bbbdf0d53ad4830f70aa421637658a1';

/// See also [RegisterOtpNotifier].
@ProviderFor(RegisterOtpNotifier)
final registerOtpNotifierProvider =
    AutoDisposeNotifierProvider<RegisterOtpNotifier, OtpNotifierState>.internal(
      RegisterOtpNotifier.new,
      name: r'registerOtpNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$registerOtpNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RegisterOtpNotifier = AutoDisposeNotifier<OtpNotifierState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
