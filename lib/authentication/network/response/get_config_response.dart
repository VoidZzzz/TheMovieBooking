import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking/authentication/data/data_vos/cinema_color_config_vo.dart';

part 'get_config_response.g.dart';

@JsonSerializable()
class GetConfigResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<CinemaColorConfigVO>? data;

  GetConfigResponse(this.code, this.message, this.data);

  factory GetConfigResponse.fromJson(Map<String, dynamic> json) => _$GetConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetConfigResponseToJson(this);
}