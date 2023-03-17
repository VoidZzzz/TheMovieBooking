
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking/authentication/persistence/hive_constants.dart';

part 'cities_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_CITIES_VO, adapterName: "CitiesVOAdapter")
class CitiesVO{

  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  @JsonKey(name: "created_at")
  @HiveField(2)
  String? createdAt;

  @JsonKey(name: "updated_at")
  @HiveField(3)
  String? updatedAt;

  CitiesVO(this.id, this.name, this.createdAt, this.updatedAt);

  factory CitiesVO.fromJson(Map<String, dynamic> json) => _$CitiesVOFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesVOToJson(this);
}