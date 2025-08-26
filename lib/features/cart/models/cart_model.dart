import 'package:bozorlik/features/products/models/product_model.dart';
import 'package:bozorlik/features/products/models/unit_model.dart';
import 'package:bozorlik/features/settings/models/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart';

part 'cart_model.g.dart';

@freezed
abstract class CartModel with _$CartModel {
  const factory CartModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'isAllBuy') bool? isAllBuy,
    @JsonKey(name: 'users') List<ProfileModel>? users,
    @JsonKey(name: 'marketLists') List<CartItem>? marketLists,
    @JsonKey(name: 'totalPrice') dynamic totalPrice,
    @JsonKey(name: 'location') dynamic location,
    @JsonKey(name: 'isCurrent') bool? isCurrent,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, Object?> json) =>
      _$CartModelFromJson(json);
}

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'product') ProductModel? product,
    @JsonKey(name: 'productType') String? productType,
    @JsonKey(name: 'productName') String? productName,
    @JsonKey(name: 'quantity') double? quantity,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'isBuying') bool? isBuying,
    @JsonKey(name: 'user') ProfileModel? user,
    @JsonKey(name: 'unit') UnitModel? unit,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, Object?> json) =>
      _$CartItemFromJson(json);
}
