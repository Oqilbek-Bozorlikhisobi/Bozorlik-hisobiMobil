import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_model.freezed.dart';
part 'unit_model.g.dart';

@freezed
abstract class UnitModel with _$UnitModel {
  const factory UnitModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'name') String? name,
  }) = _UnitModel;

  factory UnitModel.fromJson(Map<String, Object?> json) => _$UnitModelFromJson(json);
}

