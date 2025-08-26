// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartModel _$CartModelFromJson(Map<String, dynamic> json) => _CartModel(
  id: json['id'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  name: json['name'] as String?,
  isAllBuy: json['isAllBuy'] as bool?,
  users:
      (json['users'] as List<dynamic>?)
          ?.map((e) => ProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  marketLists:
      (json['marketLists'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalPrice: json['totalPrice'],
  location: json['location'],
  isCurrent: json['isCurrent'] as bool?,
);

Map<String, dynamic> _$CartModelToJson(_CartModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'name': instance.name,
      'isAllBuy': instance.isAllBuy,
      'users': instance.users,
      'marketLists': instance.marketLists,
      'totalPrice': instance.totalPrice,
      'location': instance.location,
      'isCurrent': instance.isCurrent,
    };

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  id: json['id'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  product:
      json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
  productType: json['productType'] as String?,
  productName: json['productName'] as String?,
  quantity: (json['quantity'] as num?)?.toDouble(),
  price: (json['price'] as num?)?.toDouble(),
  isBuying: json['isBuying'] as bool?,
  user:
      json['user'] == null
          ? null
          : ProfileModel.fromJson(json['user'] as Map<String, dynamic>),
  unit:
      json['unit'] == null
          ? null
          : UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'product': instance.product,
  'productType': instance.productType,
  'productName': instance.productName,
  'quantity': instance.quantity,
  'price': instance.price,
  'isBuying': instance.isBuying,
  'user': instance.user,
  'unit': instance.unit,
};
