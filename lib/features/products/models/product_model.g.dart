// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      titleEn: json['titleEn'] as String?,
      titleRu: json['titleRu'] as String?,
      titleUz: json['titleUz'] as String?,
      image: json['images'] as String?,
      category:
          json['category'] == null
              ? null
              : ProductModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'titleEn': instance.titleEn,
      'titleRu': instance.titleRu,
      'titleUz': instance.titleUz,
      'images': instance.image,
      'category': instance.category,
    };
