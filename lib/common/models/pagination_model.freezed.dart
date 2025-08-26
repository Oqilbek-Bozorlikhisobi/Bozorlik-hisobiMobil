// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationModel<T> {

@JsonKey(name: 'total') int? get total;@JsonKey(name: 'page') int? get page;@JsonKey(name: 'limit') int? get size;@JsonKey(name: 'totalPages') int? get pages; List<T>? get items;
/// Create a copy of PaginationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationModelCopyWith<T, PaginationModel<T>> get copyWith => _$PaginationModelCopyWithImpl<T, PaginationModel<T>>(this as PaginationModel<T>, _$identity);

  /// Serializes this PaginationModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationModel<T>&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.pages, pages) || other.pages == pages)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,size,pages,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'PaginationModel<$T>(total: $total, page: $page, size: $size, pages: $pages, items: $items)';
}


}

/// @nodoc
abstract mixin class $PaginationModelCopyWith<T,$Res>  {
  factory $PaginationModelCopyWith(PaginationModel<T> value, $Res Function(PaginationModel<T>) _then) = _$PaginationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total') int? total,@JsonKey(name: 'page') int? page,@JsonKey(name: 'limit') int? size,@JsonKey(name: 'totalPages') int? pages, List<T>? items
});




}
/// @nodoc
class _$PaginationModelCopyWithImpl<T,$Res>
    implements $PaginationModelCopyWith<T, $Res> {
  _$PaginationModelCopyWithImpl(this._self, this._then);

  final PaginationModel<T> _self;
  final $Res Function(PaginationModel<T>) _then;

/// Create a copy of PaginationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = freezed,Object? page = freezed,Object? size = freezed,Object? pages = freezed,Object? items = freezed,}) {
  return _then(_self.copyWith(
total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,pages: freezed == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationModel].
extension PaginationModelPatterns<T> on PaginationModel<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationModel<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationModel<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationModel<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total')  int? total, @JsonKey(name: 'page')  int? page, @JsonKey(name: 'limit')  int? size, @JsonKey(name: 'totalPages')  int? pages,  List<T>? items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationModel() when $default != null:
return $default(_that.total,_that.page,_that.size,_that.pages,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total')  int? total, @JsonKey(name: 'page')  int? page, @JsonKey(name: 'limit')  int? size, @JsonKey(name: 'totalPages')  int? pages,  List<T>? items)  $default,) {final _that = this;
switch (_that) {
case _PaginationModel():
return $default(_that.total,_that.page,_that.size,_that.pages,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total')  int? total, @JsonKey(name: 'page')  int? page, @JsonKey(name: 'limit')  int? size, @JsonKey(name: 'totalPages')  int? pages,  List<T>? items)?  $default,) {final _that = this;
switch (_that) {
case _PaginationModel() when $default != null:
return $default(_that.total,_that.page,_that.size,_that.pages,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _PaginationModel<T> implements PaginationModel<T> {
  const _PaginationModel({@JsonKey(name: 'total') this.total, @JsonKey(name: 'page') this.page, @JsonKey(name: 'limit') this.size, @JsonKey(name: 'totalPages') this.pages, final  List<T>? items}): _items = items;
  factory _PaginationModel.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PaginationModelFromJson(json,fromJsonT);

@override@JsonKey(name: 'total') final  int? total;
@override@JsonKey(name: 'page') final  int? page;
@override@JsonKey(name: 'limit') final  int? size;
@override@JsonKey(name: 'totalPages') final  int? pages;
 final  List<T>? _items;
@override List<T>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationModelCopyWith<T, _PaginationModel<T>> get copyWith => __$PaginationModelCopyWithImpl<T, _PaginationModel<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$PaginationModelToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationModel<T>&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.pages, pages) || other.pages == pages)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,size,pages,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'PaginationModel<$T>(total: $total, page: $page, size: $size, pages: $pages, items: $items)';
}


}

/// @nodoc
abstract mixin class _$PaginationModelCopyWith<T,$Res> implements $PaginationModelCopyWith<T, $Res> {
  factory _$PaginationModelCopyWith(_PaginationModel<T> value, $Res Function(_PaginationModel<T>) _then) = __$PaginationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total') int? total,@JsonKey(name: 'page') int? page,@JsonKey(name: 'limit') int? size,@JsonKey(name: 'totalPages') int? pages, List<T>? items
});




}
/// @nodoc
class __$PaginationModelCopyWithImpl<T,$Res>
    implements _$PaginationModelCopyWith<T, $Res> {
  __$PaginationModelCopyWithImpl(this._self, this._then);

  final _PaginationModel<T> _self;
  final $Res Function(_PaginationModel<T>) _then;

/// Create a copy of PaginationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = freezed,Object? page = freezed,Object? size = freezed,Object? pages = freezed,Object? items = freezed,}) {
  return _then(_PaginationModel<T>(
total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,pages: freezed == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>?,
  ));
}


}

// dart format on
