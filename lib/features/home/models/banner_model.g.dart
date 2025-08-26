// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => _BannerModel(
  id: json['id'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  nameEn: json['nameEn'] as String?,
  nameRu: json['nameRu'] as String?,
  nameUz: json['nameUz'] as String?,
  imageEn: json['imageEn'] as String?,
  imageRu: json['imageRu'] as String?,
  imageUz: json['imageUz'] as String?,
);

Map<String, dynamic> _$BannerModelToJson(_BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'nameEn': instance.nameEn,
      'nameRu': instance.nameRu,
      'nameUz': instance.nameUz,
      'imageEn': instance.imageEn,
      'imageRu': instance.imageRu,
      'imageUz': instance.imageUz,
    };
