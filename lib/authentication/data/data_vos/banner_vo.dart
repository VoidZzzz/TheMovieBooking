import 'package:json_annotation/json_annotation.dart';

part 'banner_vo.g.dart';

@JsonSerializable()
class BannerVO{
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "url")
  String? url;

  @JsonKey(name: "is_active")
  int? isActive;

  @JsonKey(name: "created_at")
  String? createdAt;

  @JsonKey(name: "updated_at")
  String? updatedAt;

  BannerVO(this.id, this.title, this.url, this.isActive, this.createdAt,
      this.updatedAt);

  factory BannerVO.fromJson(Map<String, dynamic> json) => _$BannerVOFromJson(json);

  Map<String, dynamic> toJson() => _$BannerVOToJson(this);
}