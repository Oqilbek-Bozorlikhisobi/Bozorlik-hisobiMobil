// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationModel<T> _$PaginationModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _PaginationModel<T>(
  total: (json['total'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  size: (json['limit'] as num?)?.toInt(),
  pages: (json['totalPages'] as num?)?.toInt(),
  items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
);

Map<String, dynamic> _$PaginationModelToJson<T>(
  _PaginationModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'total': instance.total,
  'page': instance.page,
  'limit': instance.size,
  'totalPages': instance.pages,
  'items': instance.items?.map(toJsonT).toList(),
};
