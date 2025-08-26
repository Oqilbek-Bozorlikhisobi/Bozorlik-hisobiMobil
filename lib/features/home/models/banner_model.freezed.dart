// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'createdAt') String? get createdAt;@JsonKey(name: 'updatedAt') String? get updatedAt;@JsonKey(name: 'nameEn') String? get nameEn;@JsonKey(name: 'nameRu') String? get nameRu;@JsonKey(name: 'nameUz') String? get nameUz;@JsonKey(name: 'imageEn') String? get imageEn;@JsonKey(name: 'imageRu') String? get imageRu;@JsonKey(name: 'imageUz') String? get imageUz;
/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerModelCopyWith<BannerModel> get copyWith => _$BannerModelCopyWithImpl<BannerModel>(this as BannerModel, _$identity);

  /// Serializes this BannerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameRu, nameRu) || other.nameRu == nameRu)&&(identical(other.nameUz, nameUz) || other.nameUz == nameUz)&&(identical(other.imageEn, imageEn) || other.imageEn == imageEn)&&(identical(other.imageRu, imageRu) || other.imageRu == imageRu)&&(identical(other.imageUz, imageUz) || other.imageUz == imageUz));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,nameEn,nameRu,nameUz,imageEn,imageRu,imageUz);

@override
String toString() {
  return 'BannerModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, nameEn: $nameEn, nameRu: $nameRu, nameUz: $nameUz, imageEn: $imageEn, imageRu: $imageRu, imageUz: $imageUz)';
}


}

/// @nodoc
abstract mixin class $BannerModelCopyWith<$Res>  {
  factory $BannerModelCopyWith(BannerModel value, $Res Function(BannerModel) _then) = _$BannerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'nameEn') String? nameEn,@JsonKey(name: 'nameRu') String? nameRu,@JsonKey(name: 'nameUz') String? nameUz,@JsonKey(name: 'imageEn') String? imageEn,@JsonKey(name: 'imageRu') String? imageRu,@JsonKey(name: 'imageUz') String? imageUz
});




}
/// @nodoc
class _$BannerModelCopyWithImpl<$Res>
    implements $BannerModelCopyWith<$Res> {
  _$BannerModelCopyWithImpl(this._self, this._then);

  final BannerModel _self;
  final $Res Function(BannerModel) _then;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? nameEn = freezed,Object? nameRu = freezed,Object? nameUz = freezed,Object? imageEn = freezed,Object? imageRu = freezed,Object? imageUz = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,nameRu: freezed == nameRu ? _self.nameRu : nameRu // ignore: cast_nullable_to_non_nullable
as String?,nameUz: freezed == nameUz ? _self.nameUz : nameUz // ignore: cast_nullable_to_non_nullable
as String?,imageEn: freezed == imageEn ? _self.imageEn : imageEn // ignore: cast_nullable_to_non_nullable
as String?,imageRu: freezed == imageRu ? _self.imageRu : imageRu // ignore: cast_nullable_to_non_nullable
as String?,imageUz: freezed == imageUz ? _self.imageUz : imageUz // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerModel].
extension BannerModelPatterns on BannerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'nameEn')  String? nameEn, @JsonKey(name: 'nameRu')  String? nameRu, @JsonKey(name: 'nameUz')  String? nameUz, @JsonKey(name: 'imageEn')  String? imageEn, @JsonKey(name: 'imageRu')  String? imageRu, @JsonKey(name: 'imageUz')  String? imageUz)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.nameEn,_that.nameRu,_that.nameUz,_that.imageEn,_that.imageRu,_that.imageUz);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'nameEn')  String? nameEn, @JsonKey(name: 'nameRu')  String? nameRu, @JsonKey(name: 'nameUz')  String? nameUz, @JsonKey(name: 'imageEn')  String? imageEn, @JsonKey(name: 'imageRu')  String? imageRu, @JsonKey(name: 'imageUz')  String? imageUz)  $default,) {final _that = this;
switch (_that) {
case _BannerModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.nameEn,_that.nameRu,_that.nameUz,_that.imageEn,_that.imageRu,_that.imageUz);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'nameEn')  String? nameEn, @JsonKey(name: 'nameRu')  String? nameRu, @JsonKey(name: 'nameUz')  String? nameUz, @JsonKey(name: 'imageEn')  String? imageEn, @JsonKey(name: 'imageRu')  String? imageRu, @JsonKey(name: 'imageUz')  String? imageUz)?  $default,) {final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.nameEn,_that.nameRu,_that.nameUz,_that.imageEn,_that.imageRu,_that.imageUz);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerModel implements BannerModel {
  const _BannerModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'createdAt') this.createdAt, @JsonKey(name: 'updatedAt') this.updatedAt, @JsonKey(name: 'nameEn') this.nameEn, @JsonKey(name: 'nameRu') this.nameRu, @JsonKey(name: 'nameUz') this.nameUz, @JsonKey(name: 'imageEn') this.imageEn, @JsonKey(name: 'imageRu') this.imageRu, @JsonKey(name: 'imageUz') this.imageUz});
  factory _BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'createdAt') final  String? createdAt;
@override@JsonKey(name: 'updatedAt') final  String? updatedAt;
@override@JsonKey(name: 'nameEn') final  String? nameEn;
@override@JsonKey(name: 'nameRu') final  String? nameRu;
@override@JsonKey(name: 'nameUz') final  String? nameUz;
@override@JsonKey(name: 'imageEn') final  String? imageEn;
@override@JsonKey(name: 'imageRu') final  String? imageRu;
@override@JsonKey(name: 'imageUz') final  String? imageUz;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerModelCopyWith<_BannerModel> get copyWith => __$BannerModelCopyWithImpl<_BannerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.nameRu, nameRu) || other.nameRu == nameRu)&&(identical(other.nameUz, nameUz) || other.nameUz == nameUz)&&(identical(other.imageEn, imageEn) || other.imageEn == imageEn)&&(identical(other.imageRu, imageRu) || other.imageRu == imageRu)&&(identical(other.imageUz, imageUz) || other.imageUz == imageUz));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,nameEn,nameRu,nameUz,imageEn,imageRu,imageUz);

@override
String toString() {
  return 'BannerModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, nameEn: $nameEn, nameRu: $nameRu, nameUz: $nameUz, imageEn: $imageEn, imageRu: $imageRu, imageUz: $imageUz)';
}


}

/// @nodoc
abstract mixin class _$BannerModelCopyWith<$Res> implements $BannerModelCopyWith<$Res> {
  factory _$BannerModelCopyWith(_BannerModel value, $Res Function(_BannerModel) _then) = __$BannerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'nameEn') String? nameEn,@JsonKey(name: 'nameRu') String? nameRu,@JsonKey(name: 'nameUz') String? nameUz,@JsonKey(name: 'imageEn') String? imageEn,@JsonKey(name: 'imageRu') String? imageRu,@JsonKey(name: 'imageUz') String? imageUz
});




}
/// @nodoc
class __$BannerModelCopyWithImpl<$Res>
    implements _$BannerModelCopyWith<$Res> {
  __$BannerModelCopyWithImpl(this._self, this._then);

  final _BannerModel _self;
  final $Res Function(_BannerModel) _then;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? nameEn = freezed,Object? nameRu = freezed,Object? nameUz = freezed,Object? imageEn = freezed,Object? imageRu = freezed,Object? imageUz = freezed,}) {
  return _then(_BannerModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,nameRu: freezed == nameRu ? _self.nameRu : nameRu // ignore: cast_nullable_to_non_nullable
as String?,nameUz: freezed == nameUz ? _self.nameUz : nameUz // ignore: cast_nullable_to_non_nullable
as String?,imageEn: freezed == imageEn ? _self.imageEn : imageEn // ignore: cast_nullable_to_non_nullable
as String?,imageRu: freezed == imageRu ? _self.imageRu : imageRu // ignore: cast_nullable_to_non_nullable
as String?,imageUz: freezed == imageUz ? _self.imageUz : imageUz // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
