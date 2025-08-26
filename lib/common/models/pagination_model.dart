import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';

part 'pagination_model.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PaginationModel<T> with _$PaginationModel<T> {
  const factory PaginationModel({
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'limit') int? size,
    @JsonKey(name: 'totalPages') int? pages,
    List<T>? items,
  }) = _PaginationModel<T>;

  factory PaginationModel.fromJson(
          Map<String, Object?> json, T Function(Object?) fromJsonT) =>
      _$PaginationModelFromJson(json, fromJsonT);
}
