// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'createdAt') String? get createdAt;@JsonKey(name: 'updatedAt') String? get updatedAt;@JsonKey(name: 'titleEn') String? get titleEn;@JsonKey(name: 'titleRu') String? get titleRu;@JsonKey(name: 'titleUz') String? get titleUz;@JsonKey(name: 'images') String? get image;@JsonKey(name: 'category') ProductModel? get category;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleRu, titleRu) || other.titleRu == titleRu)&&(identical(other.titleUz, titleUz) || other.titleUz == titleUz)&&(identical(other.image, image) || other.image == image)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,titleEn,titleRu,titleUz,image,category);

@override
String toString() {
  return 'ProductModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, titleEn: $titleEn, titleRu: $titleRu, titleUz: $titleUz, image: $image, category: $category)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'titleEn') String? titleEn,@JsonKey(name: 'titleRu') String? titleRu,@JsonKey(name: 'titleUz') String? titleUz,@JsonKey(name: 'images') String? image,@JsonKey(name: 'category') ProductModel? category
});


$ProductModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? titleEn = freezed,Object? titleRu = freezed,Object? titleUz = freezed,Object? image = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,titleEn: freezed == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String?,titleRu: freezed == titleRu ? _self.titleRu : titleRu // ignore: cast_nullable_to_non_nullable
as String?,titleUz: freezed == titleUz ? _self.titleUz : titleUz // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ProductModel?,
  ));
}
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'titleEn')  String? titleEn, @JsonKey(name: 'titleRu')  String? titleRu, @JsonKey(name: 'titleUz')  String? titleUz, @JsonKey(name: 'images')  String? image, @JsonKey(name: 'category')  ProductModel? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.titleEn,_that.titleRu,_that.titleUz,_that.image,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'titleEn')  String? titleEn, @JsonKey(name: 'titleRu')  String? titleRu, @JsonKey(name: 'titleUz')  String? titleUz, @JsonKey(name: 'images')  String? image, @JsonKey(name: 'category')  ProductModel? category)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.titleEn,_that.titleRu,_that.titleUz,_that.image,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'titleEn')  String? titleEn, @JsonKey(name: 'titleRu')  String? titleRu, @JsonKey(name: 'titleUz')  String? titleUz, @JsonKey(name: 'images')  String? image, @JsonKey(name: 'category')  ProductModel? category)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.titleEn,_that.titleRu,_that.titleUz,_that.image,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel implements ProductModel {
  const _ProductModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'createdAt') this.createdAt, @JsonKey(name: 'updatedAt') this.updatedAt, @JsonKey(name: 'titleEn') this.titleEn, @JsonKey(name: 'titleRu') this.titleRu, @JsonKey(name: 'titleUz') this.titleUz, @JsonKey(name: 'images') this.image, @JsonKey(name: 'category') this.category});
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'createdAt') final  String? createdAt;
@override@JsonKey(name: 'updatedAt') final  String? updatedAt;
@override@JsonKey(name: 'titleEn') final  String? titleEn;
@override@JsonKey(name: 'titleRu') final  String? titleRu;
@override@JsonKey(name: 'titleUz') final  String? titleUz;
@override@JsonKey(name: 'images') final  String? image;
@override@JsonKey(name: 'category') final  ProductModel? category;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.titleRu, titleRu) || other.titleRu == titleRu)&&(identical(other.titleUz, titleUz) || other.titleUz == titleUz)&&(identical(other.image, image) || other.image == image)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,titleEn,titleRu,titleUz,image,category);

@override
String toString() {
  return 'ProductModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, titleEn: $titleEn, titleRu: $titleRu, titleUz: $titleUz, image: $image, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'titleEn') String? titleEn,@JsonKey(name: 'titleRu') String? titleRu,@JsonKey(name: 'titleUz') String? titleUz,@JsonKey(name: 'images') String? image,@JsonKey(name: 'category') ProductModel? category
});


@override $ProductModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? titleEn = freezed,Object? titleRu = freezed,Object? titleUz = freezed,Object? image = freezed,Object? category = freezed,}) {
  return _then(_ProductModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,titleEn: freezed == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String?,titleRu: freezed == titleRu ? _self.titleRu : titleRu // ignore: cast_nullable_to_non_nullable
as String?,titleUz: freezed == titleUz ? _self.titleUz : titleUz // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ProductModel?,
  ));
}

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
