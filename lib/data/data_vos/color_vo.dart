import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../persistence/hive_constants.dart';

part 'color_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_COLOR_VO, adapterName: "ColorVOAdapter")
class ColorVO{

  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "title")
  @HiveField(1)
  String? title;

  @JsonKey(name: "color")
  @HiveField(2)
  String? color;

  ColorVO(this.id, this.title, this.color);

  factory ColorVO.fromJson(Map<String, dynamic> json) => _$ColorVOFromJson(json);

  Map<String, dynamic> toJson() => _$ColorVOToJson(this);

  @override
  String toString() {
    return 'ColorVO{id: $id, title: $title, color: $color}';
  }
}