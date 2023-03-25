import 'package:json_annotation/json_annotation.dart';
import '../../data/data_vos/snack_vo.dart';

part 'get_snacks_response.g.dart';

@JsonSerializable()
class GetSnacksResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<SnackVO>? data;

  GetSnacksResponse(this.code, this.message, this.data);

  factory GetSnacksResponse.fromJson(Map<String, dynamic> json) => _$GetSnacksResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSnacksResponseToJson(this);
}