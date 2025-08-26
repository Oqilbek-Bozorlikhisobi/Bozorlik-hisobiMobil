// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      titleEn: json['titleEn'] as String?,
      titleRu: json['titleRu'] as String?,
      titleUz: json['titleUz'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'titleEn': instance.titleEn,
      'titleRu': instance.titleRu,
      'titleUz': instance.titleUz,
      'image': instance.image,
    };
