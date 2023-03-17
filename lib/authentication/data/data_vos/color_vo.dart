import 'package:json_annotation/json_annotation.dart';

part 'color_vo.g.dart';

@JsonSerializable()
class ColorVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "color")
  String? color;

  ColorVO(this.id, this.title, this.color);

  factory ColorVO.fromJson(Map<String, dynamic> json) => _$ColorVOFromJson(json);

  Map<String, dynamic> toJson() => _$ColorVOToJson(this);

  @override
  String toString() {
    return 'ColorVO{id: $id, title: $title, color: $color}';
  }
}