import 'package:json_annotation/json_annotation.dart';

import '../../data/data_vos/cinema_vo.dart';

part 'get_cinema_and_show_time_by_date_response.g.dart';

@JsonSerializable()
class GetCinemaAndShowTimeByDateResponse{

  @JsonKey(name: "code")
  int? code;


  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<CinemaVO>? data;

  GetCinemaAndShowTimeByDateResponse(this.code, this.message, this.data);

  factory GetCinemaAndShowTimeByDateResponse.fromJson(Map<String, dynamic> json) => _$GetCinemaAndShowTimeByDateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCinemaAndShowTimeByDateResponseToJson(this);
}