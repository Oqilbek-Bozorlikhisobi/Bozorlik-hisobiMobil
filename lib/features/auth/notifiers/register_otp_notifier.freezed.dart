// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_otp_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtpNotifierState {

 bool? get isLoading; LoginResponse? get result; String? get error; int get resendAvailableIn;
/// Create a copy of OtpNotifierState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpNotifierStateCopyWith<OtpNotifierState> get copyWith => _$OtpNotifierStateCopyWithImpl<OtpNotifierState>(this as OtpNotifierState, _$identity);

  /// Serializes this OtpNotifierState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpNotifierState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.result, result) || other.result == result)&&(identical(other.error, error) || other.error == error)&&(identical(other.resendAvailableIn, resendAvailableIn) || other.resendAvailableIn == resendAvailableIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLoading,result,error,resendAvailableIn);

@override
String toString() {
  return 'OtpNotifierState(isLoading: $isLoading, result: $result, error: $error, resendAvailableIn: $resendAvailableIn)';
}


}

/// @nodoc
abstract mixin class $OtpNotifierStateCopyWith<$Res>  {
  factory $OtpNotifierStateCopyWith(OtpNotifierState value, $Res Function(OtpNotifierState) _then) = _$OtpNotifierStateCopyWithImpl;
@useResult
$Res call({
 bool? isLoading, LoginResponse? result, String? error, int resendAvailableIn
});


$LoginResponseCopyWith<$Res>? get result;

}
/// @nodoc
class _$OtpNotifierStateCopyWithImpl<$Res>
    implements $OtpNotifierStateCopyWith<$Res> {
  _$OtpNotifierStateCopyWithImpl(this._self, this._then);

  final OtpNotifierState _self;
  final $Res Function(OtpNotifierState) _then;

/// Create a copy of OtpNotifierState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = freezed,Object? result = freezed,Object? error = freezed,Object? resendAvailableIn = null,}) {
  return _then(_self.copyWith(
isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as LoginResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,resendAvailableIn: null == resendAvailableIn ? _self.resendAvailableIn : resendAvailableIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of OtpNotifierState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $LoginResponseCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [OtpNotifierState].
extension OtpNotifierStatePatterns on OtpNotifierState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpNotifierState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpNotifierState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpNotifierState value)  $default,){
final _that = this;
switch (_that) {
case _OtpNotifierState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpNotifierState value)?  $default,){
final _that = this;
switch (_that) {
case _OtpNotifierState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? isLoading,  LoginResponse? result,  String? error,  int resendAvailableIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpNotifierState() when $default != null:
return $default(_that.isLoading,_that.result,_that.error,_that.resendAvailableIn);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? isLoading,  LoginResponse? result,  String? error,  int resendAvailableIn)  $default,) {final _that = this;
switch (_that) {
case _OtpNotifierState():
return $default(_that.isLoading,_that.result,_that.error,_that.resendAvailableIn);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? isLoading,  LoginResponse? result,  String? error,  int resendAvailableIn)?  $default,) {final _that = this;
switch (_that) {
case _OtpNotifierState() when $default != null:
return $default(_that.isLoading,_that.result,_that.error,_that.resendAvailableIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtpNotifierState implements OtpNotifierState {
  const _OtpNotifierState({this.isLoading = false, this.result, this.error, this.resendAvailableIn = 60});
  factory _OtpNotifierState.fromJson(Map<String, dynamic> json) => _$OtpNotifierStateFromJson(json);

@override@JsonKey() final  bool? isLoading;
@override final  LoginResponse? result;
@override final  String? error;
@override@JsonKey() final  int resendAvailableIn;

/// Create a copy of OtpNotifierState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpNotifierStateCopyWith<_OtpNotifierState> get copyWith => __$OtpNotifierStateCopyWithImpl<_OtpNotifierState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtpNotifierStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpNotifierState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.result, result) || other.result == result)&&(identical(other.error, error) || other.error == error)&&(identical(other.resendAvailableIn, resendAvailableIn) || other.resendAvailableIn == resendAvailableIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLoading,result,error,resendAvailableIn);

@override
String toString() {
  return 'OtpNotifierState(isLoading: $isLoading, result: $result, error: $error, resendAvailableIn: $resendAvailableIn)';
}


}

/// @nodoc
abstract mixin class _$OtpNotifierStateCopyWith<$Res> implements $OtpNotifierStateCopyWith<$Res> {
  factory _$OtpNotifierStateCopyWith(_OtpNotifierState value, $Res Function(_OtpNotifierState) _then) = __$OtpNotifierStateCopyWithImpl;
@override @useResult
$Res call({
 bool? isLoading, LoginResponse? result, String? error, int resendAvailableIn
});


@override $LoginResponseCopyWith<$Res>? get result;

}
/// @nodoc
class __$OtpNotifierStateCopyWithImpl<$Res>
    implements _$OtpNotifierStateCopyWith<$Res> {
  __$OtpNotifierStateCopyWithImpl(this._self, this._then);

  final _OtpNotifierState _self;
  final $Res Function(_OtpNotifierState) _then;

/// Create a copy of OtpNotifierState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = freezed,Object? result = freezed,Object? error = freezed,Object? resendAvailableIn = null,}) {
  return _then(_OtpNotifierState(
isLoading: freezed == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as LoginResponse?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,resendAvailableIn: null == resendAvailableIn ? _self.resendAvailableIn : resendAvailableIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of OtpNotifierState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $LoginResponseCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
