import 'package:json_annotation/json_annotation.dart';

part 'cast_vo.g.dart';

@JsonSerializable()
class CastVO{

  @JsonKey(name: "adult")
  bool? adult;

  @JsonKey(name: "gender")
  int? gender;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "known_for_department")
  String? knownForDepartment;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "original_name")
  String? originalName;

  @JsonKey(name: "popularity")
  double? popularity;

  @JsonKey(name: "profile_path")
  String? profilePath;

  @JsonKey(name: "cast_id")
  int? castId;

  @JsonKey(name: "character")
  String? character;

  @JsonKey(name: "credit_id")
  String? creditId;

  @JsonKey(name: "order")
  double? order;

  CastVO(
      this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order);

  factory CastVO.fromJson(Map<String, dynamic> json) => _$CastVOFromJson(json);

  Map<String, dynamic> toJson() => _$CastVOToJson(this);
}