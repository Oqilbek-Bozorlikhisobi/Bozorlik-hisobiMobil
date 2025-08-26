// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'createdAt') String? get createdAt;@JsonKey(name: 'updatedAt') String? get updatedAt;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'isAllBuy') bool? get isAllBuy;@JsonKey(name: 'users') List<ProfileModel>? get users;@JsonKey(name: 'marketLists') List<CartItem>? get marketLists;@JsonKey(name: 'totalPrice') dynamic get totalPrice;@JsonKey(name: 'location') dynamic get location;@JsonKey(name: 'isCurrent') bool? get isCurrent;
/// Create a copy of CartModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartModelCopyWith<CartModel> get copyWith => _$CartModelCopyWithImpl<CartModel>(this as CartModel, _$identity);

  /// Serializes this CartModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.isAllBuy, isAllBuy) || other.isAllBuy == isAllBuy)&&const DeepCollectionEquality().equals(other.users, users)&&const DeepCollectionEquality().equals(other.marketLists, marketLists)&&const DeepCollectionEquality().equals(other.totalPrice, totalPrice)&&const DeepCollectionEquality().equals(other.location, location)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,name,isAllBuy,const DeepCollectionEquality().hash(users),const DeepCollectionEquality().hash(marketLists),const DeepCollectionEquality().hash(totalPrice),const DeepCollectionEquality().hash(location),isCurrent);

@override
String toString() {
  return 'CartModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, isAllBuy: $isAllBuy, users: $users, marketLists: $marketLists, totalPrice: $totalPrice, location: $location, isCurrent: $isCurrent)';
}


}

/// @nodoc
abstract mixin class $CartModelCopyWith<$Res>  {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) _then) = _$CartModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'name') String? name,@JsonKey(name: 'isAllBuy') bool? isAllBuy,@JsonKey(name: 'users') List<ProfileModel>? users,@JsonKey(name: 'marketLists') List<CartItem>? marketLists,@JsonKey(name: 'totalPrice') dynamic totalPrice,@JsonKey(name: 'location') dynamic location,@JsonKey(name: 'isCurrent') bool? isCurrent
});




}
/// @nodoc
class _$CartModelCopyWithImpl<$Res>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._self, this._then);

  final CartModel _self;
  final $Res Function(CartModel) _then;

/// Create a copy of CartModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? name = freezed,Object? isAllBuy = freezed,Object? users = freezed,Object? marketLists = freezed,Object? totalPrice = freezed,Object? location = freezed,Object? isCurrent = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isAllBuy: freezed == isAllBuy ? _self.isAllBuy : isAllBuy // ignore: cast_nullable_to_non_nullable
as bool?,users: freezed == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<ProfileModel>?,marketLists: freezed == marketLists ? _self.marketLists : marketLists // ignore: cast_nullable_to_non_nullable
as List<CartItem>?,totalPrice: freezed == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as dynamic,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as dynamic,isCurrent: freezed == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartModel].
extension CartModelPatterns on CartModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartModel value)  $default,){
final _that = this;
switch (_that) {
case _CartModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartModel value)?  $default,){
final _that = this;
switch (_that) {
case _CartModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'isAllBuy')  bool? isAllBuy, @JsonKey(name: 'users')  List<ProfileModel>? users, @JsonKey(name: 'marketLists')  List<CartItem>? marketLists, @JsonKey(name: 'totalPrice')  dynamic totalPrice, @JsonKey(name: 'location')  dynamic location, @JsonKey(name: 'isCurrent')  bool? isCurrent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.isAllBuy,_that.users,_that.marketLists,_that.totalPrice,_that.location,_that.isCurrent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'isAllBuy')  bool? isAllBuy, @JsonKey(name: 'users')  List<ProfileModel>? users, @JsonKey(name: 'marketLists')  List<CartItem>? marketLists, @JsonKey(name: 'totalPrice')  dynamic totalPrice, @JsonKey(name: 'location')  dynamic location, @JsonKey(name: 'isCurrent')  bool? isCurrent)  $default,) {final _that = this;
switch (_that) {
case _CartModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.isAllBuy,_that.users,_that.marketLists,_that.totalPrice,_that.location,_that.isCurrent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'isAllBuy')  bool? isAllBuy, @JsonKey(name: 'users')  List<ProfileModel>? users, @JsonKey(name: 'marketLists')  List<CartItem>? marketLists, @JsonKey(name: 'totalPrice')  dynamic totalPrice, @JsonKey(name: 'location')  dynamic location, @JsonKey(name: 'isCurrent')  bool? isCurrent)?  $default,) {final _that = this;
switch (_that) {
case _CartModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.name,_that.isAllBuy,_that.users,_that.marketLists,_that.totalPrice,_that.location,_that.isCurrent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartModel implements CartModel {
  const _CartModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'createdAt') this.createdAt, @JsonKey(name: 'updatedAt') this.updatedAt, @JsonKey(name: 'name') this.name, @JsonKey(name: 'isAllBuy') this.isAllBuy, @JsonKey(name: 'users') final  List<ProfileModel>? users, @JsonKey(name: 'marketLists') final  List<CartItem>? marketLists, @JsonKey(name: 'totalPrice') this.totalPrice, @JsonKey(name: 'location') this.location, @JsonKey(name: 'isCurrent') this.isCurrent}): _users = users,_marketLists = marketLists;
  factory _CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'createdAt') final  String? createdAt;
@override@JsonKey(name: 'updatedAt') final  String? updatedAt;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'isAllBuy') final  bool? isAllBuy;
 final  List<ProfileModel>? _users;
@override@JsonKey(name: 'users') List<ProfileModel>? get users {
  final value = _users;
  if (value == null) return null;
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CartItem>? _marketLists;
@override@JsonKey(name: 'marketLists') List<CartItem>? get marketLists {
  final value = _marketLists;
  if (value == null) return null;
  if (_marketLists is EqualUnmodifiableListView) return _marketLists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'totalPrice') final  dynamic totalPrice;
@override@JsonKey(name: 'location') final  dynamic location;
@override@JsonKey(name: 'isCurrent') final  bool? isCurrent;

/// Create a copy of CartModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartModelCopyWith<_CartModel> get copyWith => __$CartModelCopyWithImpl<_CartModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.isAllBuy, isAllBuy) || other.isAllBuy == isAllBuy)&&const DeepCollectionEquality().equals(other._users, _users)&&const DeepCollectionEquality().equals(other._marketLists, _marketLists)&&const DeepCollectionEquality().equals(other.totalPrice, totalPrice)&&const DeepCollectionEquality().equals(other.location, location)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,name,isAllBuy,const DeepCollectionEquality().hash(_users),const DeepCollectionEquality().hash(_marketLists),const DeepCollectionEquality().hash(totalPrice),const DeepCollectionEquality().hash(location),isCurrent);

@override
String toString() {
  return 'CartModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, isAllBuy: $isAllBuy, users: $users, marketLists: $marketLists, totalPrice: $totalPrice, location: $location, isCurrent: $isCurrent)';
}


}

/// @nodoc
abstract mixin class _$CartModelCopyWith<$Res> implements $CartModelCopyWith<$Res> {
  factory _$CartModelCopyWith(_CartModel value, $Res Function(_CartModel) _then) = __$CartModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'name') String? name,@JsonKey(name: 'isAllBuy') bool? isAllBuy,@JsonKey(name: 'users') List<ProfileModel>? users,@JsonKey(name: 'marketLists') List<CartItem>? marketLists,@JsonKey(name: 'totalPrice') dynamic totalPrice,@JsonKey(name: 'location') dynamic location,@JsonKey(name: 'isCurrent') bool? isCurrent
});




}
/// @nodoc
class __$CartModelCopyWithImpl<$Res>
    implements _$CartModelCopyWith<$Res> {
  __$CartModelCopyWithImpl(this._self, this._then);

  final _CartModel _self;
  final $Res Function(_CartModel) _then;

/// Create a copy of CartModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? name = freezed,Object? isAllBuy = freezed,Object? users = freezed,Object? marketLists = freezed,Object? totalPrice = freezed,Object? location = freezed,Object? isCurrent = freezed,}) {
  return _then(_CartModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,isAllBuy: freezed == isAllBuy ? _self.isAllBuy : isAllBuy // ignore: cast_nullable_to_non_nullable
as bool?,users: freezed == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<ProfileModel>?,marketLists: freezed == marketLists ? _self._marketLists : marketLists // ignore: cast_nullable_to_non_nullable
as List<CartItem>?,totalPrice: freezed == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as dynamic,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as dynamic,isCurrent: freezed == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$CartItem {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'createdAt') String? get createdAt;@JsonKey(name: 'updatedAt') String? get updatedAt;@JsonKey(name: 'product') ProductModel? get product;@JsonKey(name: 'productType') String? get productType;@JsonKey(name: 'productName') String? get productName;@JsonKey(name: 'quantity') double? get quantity;@JsonKey(name: 'price') double? get price;@JsonKey(name: 'isBuying') bool? get isBuying;@JsonKey(name: 'user') ProfileModel? get user;@JsonKey(name: 'unit') UnitModel? get unit;
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemCopyWith<CartItem> get copyWith => _$CartItemCopyWithImpl<CartItem>(this as CartItem, _$identity);

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItem&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.product, product) || other.product == product)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.isBuying, isBuying) || other.isBuying == isBuying)&&(identical(other.user, user) || other.user == user)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,product,productType,productName,quantity,price,isBuying,user,unit);

@override
String toString() {
  return 'CartItem(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, product: $product, productType: $productType, productName: $productName, quantity: $quantity, price: $price, isBuying: $isBuying, user: $user, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $CartItemCopyWith<$Res>  {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) _then) = _$CartItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'product') ProductModel? product,@JsonKey(name: 'productType') String? productType,@JsonKey(name: 'productName') String? productName,@JsonKey(name: 'quantity') double? quantity,@JsonKey(name: 'price') double? price,@JsonKey(name: 'isBuying') bool? isBuying,@JsonKey(name: 'user') ProfileModel? user,@JsonKey(name: 'unit') UnitModel? unit
});


$ProductModelCopyWith<$Res>? get product;$ProfileModelCopyWith<$Res>? get user;$UnitModelCopyWith<$Res>? get unit;

}
/// @nodoc
class _$CartItemCopyWithImpl<$Res>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._self, this._then);

  final CartItem _self;
  final $Res Function(CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? product = freezed,Object? productType = freezed,Object? productName = freezed,Object? quantity = freezed,Object? price = freezed,Object? isBuying = freezed,Object? user = freezed,Object? unit = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel?,productType: freezed == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,isBuying: freezed == isBuying ? _self.isBuying : isBuying // ignore: cast_nullable_to_non_nullable
as bool?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProfileModel?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitModel?,
  ));
}
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ProfileModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitModelCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $UnitModelCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartItem].
extension CartItemPatterns on CartItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItem value)  $default,){
final _that = this;
switch (_that) {
case _CartItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItem value)?  $default,){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'product')  ProductModel? product, @JsonKey(name: 'productType')  String? productType, @JsonKey(name: 'productName')  String? productName, @JsonKey(name: 'quantity')  double? quantity, @JsonKey(name: 'price')  double? price, @JsonKey(name: 'isBuying')  bool? isBuying, @JsonKey(name: 'user')  ProfileModel? user, @JsonKey(name: 'unit')  UnitModel? unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.product,_that.productType,_that.productName,_that.quantity,_that.price,_that.isBuying,_that.user,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'product')  ProductModel? product, @JsonKey(name: 'productType')  String? productType, @JsonKey(name: 'productName')  String? productName, @JsonKey(name: 'quantity')  double? quantity, @JsonKey(name: 'price')  double? price, @JsonKey(name: 'isBuying')  bool? isBuying, @JsonKey(name: 'user')  ProfileModel? user, @JsonKey(name: 'unit')  UnitModel? unit)  $default,) {final _that = this;
switch (_that) {
case _CartItem():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.product,_that.productType,_that.productName,_that.quantity,_that.price,_that.isBuying,_that.user,_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String? id, @JsonKey(name: 'createdAt')  String? createdAt, @JsonKey(name: 'updatedAt')  String? updatedAt, @JsonKey(name: 'product')  ProductModel? product, @JsonKey(name: 'productType')  String? productType, @JsonKey(name: 'productName')  String? productName, @JsonKey(name: 'quantity')  double? quantity, @JsonKey(name: 'price')  double? price, @JsonKey(name: 'isBuying')  bool? isBuying, @JsonKey(name: 'user')  ProfileModel? user, @JsonKey(name: 'unit')  UnitModel? unit)?  $default,) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.product,_that.productType,_that.productName,_that.quantity,_that.price,_that.isBuying,_that.user,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItem implements CartItem {
  const _CartItem({@JsonKey(name: 'id') this.id, @JsonKey(name: 'createdAt') this.createdAt, @JsonKey(name: 'updatedAt') this.updatedAt, @JsonKey(name: 'product') this.product, @JsonKey(name: 'productType') this.productType, @JsonKey(name: 'productName') this.productName, @JsonKey(name: 'quantity') this.quantity, @JsonKey(name: 'price') this.price, @JsonKey(name: 'isBuying') this.isBuying, @JsonKey(name: 'user') this.user, @JsonKey(name: 'unit') this.unit});
  factory _CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'createdAt') final  String? createdAt;
@override@JsonKey(name: 'updatedAt') final  String? updatedAt;
@override@JsonKey(name: 'product') final  ProductModel? product;
@override@JsonKey(name: 'productType') final  String? productType;
@override@JsonKey(name: 'productName') final  String? productName;
@override@JsonKey(name: 'quantity') final  double? quantity;
@override@JsonKey(name: 'price') final  double? price;
@override@JsonKey(name: 'isBuying') final  bool? isBuying;
@override@JsonKey(name: 'user') final  ProfileModel? user;
@override@JsonKey(name: 'unit') final  UnitModel? unit;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemCopyWith<_CartItem> get copyWith => __$CartItemCopyWithImpl<_CartItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItem&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.product, product) || other.product == product)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.isBuying, isBuying) || other.isBuying == isBuying)&&(identical(other.user, user) || other.user == user)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,product,productType,productName,quantity,price,isBuying,user,unit);

@override
String toString() {
  return 'CartItem(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, product: $product, productType: $productType, productName: $productName, quantity: $quantity, price: $price, isBuying: $isBuying, user: $user, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$CartItemCopyWith(_CartItem value, $Res Function(_CartItem) _then) = __$CartItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'product') ProductModel? product,@JsonKey(name: 'productType') String? productType,@JsonKey(name: 'productName') String? productName,@JsonKey(name: 'quantity') double? quantity,@JsonKey(name: 'price') double? price,@JsonKey(name: 'isBuying') bool? isBuying,@JsonKey(name: 'user') ProfileModel? user,@JsonKey(name: 'unit') UnitModel? unit
});


@override $ProductModelCopyWith<$Res>? get product;@override $ProfileModelCopyWith<$Res>? get user;@override $UnitModelCopyWith<$Res>? get unit;

}
/// @nodoc
class __$CartItemCopyWithImpl<$Res>
    implements _$CartItemCopyWith<$Res> {
  __$CartItemCopyWithImpl(this._self, this._then);

  final _CartItem _self;
  final $Res Function(_CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? product = freezed,Object? productType = freezed,Object? productName = freezed,Object? quantity = freezed,Object? price = freezed,Object? isBuying = freezed,Object? user = freezed,Object? unit = freezed,}) {
  return _then(_CartItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel?,productType: freezed == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,isBuying: freezed == isBuying ? _self.isBuying : isBuying // ignore: cast_nullable_to_non_nullable
as bool?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProfileModel?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitModel?,
  ));
}

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductModelCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $ProfileModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitModelCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $UnitModelCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}

// dart format on
