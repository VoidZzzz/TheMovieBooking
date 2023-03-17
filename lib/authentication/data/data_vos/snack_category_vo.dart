import 'package:json_annotation/json_annotation.dart';

part 'snack_category_vo.g.dart';

@JsonSerializable()
class SnackCategoryVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "titlemm")
  String? titleMm;

  @JsonKey(name: "is_active")
  int? isActive;

  @JsonKey(name: "created_at")
  String? createdAt;

  @JsonKey(name: "updated_at")
  String? updatedAt;

  @JsonKey(name: "deleted_at")
  dynamic deletedAt;

  SnackCategoryVO(this.id, this.title, this.titleMm, this.isActive,
      this.createdAt, this.updatedAt, this.deletedAt);

  factory SnackCategoryVO.fromJson(Map<String, dynamic> json) => _$SnackCategoryVOFromJson(json);

  Map<String, dynamic> toJson() => _$SnackCategoryVOToJson(this);
}