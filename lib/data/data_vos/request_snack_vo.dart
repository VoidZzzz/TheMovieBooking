import 'package:json_annotation/json_annotation.dart';

part 'request_snack_vo.g.dart';

@JsonSerializable()
class RequestSnackVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "quantity")
  int? quantity;

  RequestSnackVO(this.id, this.quantity);

  factory RequestSnackVO.fromJson(Map<String, dynamic> json) => _$RequestSnackVOFromJson(json);

  Map<String, dynamic> toJson() => _$RequestSnackVOToJson(this);
}