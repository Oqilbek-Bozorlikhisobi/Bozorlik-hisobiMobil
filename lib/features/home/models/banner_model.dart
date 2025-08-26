import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.freezed.dart';

part 'banner_model.g.dart';

@freezed
abstract class BannerModel with _$BannerModel {
  const factory BannerModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'nameEn') String? nameEn,
    @JsonKey(name: 'nameRu') String? nameRu,
    @JsonKey(name: 'nameUz') String? nameUz,
    @JsonKey(name: 'imageEn') String? imageEn,
    @JsonKey(name: 'imageRu') String? imageRu,
    @JsonKey(name: 'imageUz') String? imageUz,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, Object?> json) =>
      _$BannerModelFromJson(json);
}
