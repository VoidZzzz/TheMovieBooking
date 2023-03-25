
import 'package:json_annotation/json_annotation.dart';

part 'cinema_color_config_vo.g.dart';

@JsonSerializable()
class CinemaColorConfigVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "key")
  String? key;

  @JsonKey(name: "value")
  dynamic value;

  CinemaColorConfigVO(this.id, this.key, this.value);

  factory CinemaColorConfigVO.fromJson(Map<String, dynamic> json) => _$CinemaColorConfigVOFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaColorConfigVOToJson(this);

  @override
  String toString() {
    return 'CinemaColorConfigVO{id: $id, key: $key, value: $value}';
  }
}