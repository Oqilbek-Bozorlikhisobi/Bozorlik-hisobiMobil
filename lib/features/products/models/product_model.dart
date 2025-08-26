import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'titleEn') String? titleEn,
    @JsonKey(name: 'titleRu') String? titleRu,
    @JsonKey(name: 'titleUz') String? titleUz,
    @JsonKey(name: 'images') String? image,
    @JsonKey(name: 'category') ProductModel? category,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
}
