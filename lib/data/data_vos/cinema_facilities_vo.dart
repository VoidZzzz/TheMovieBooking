import 'package:json_annotation/json_annotation.dart';

part 'cinema_facilities_vo.g.dart';

@JsonSerializable()
class CinemaFacilitiesVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "img")
  String? img;

  CinemaFacilitiesVO(this.id, this.title, this.img);

  factory CinemaFacilitiesVO.fromJson(Map<String, dynamic> json) => _$CinemaFacilitiesVOFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaFacilitiesVOToJson(this);
}