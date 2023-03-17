import 'package:json_annotation/json_annotation.dart';
import '../../data/data_vos/cinema_details_vo.dart';

part 'get_cinema_response.g.dart';

@JsonSerializable()
class GetCinemaResponse{
  int? code;
  String? message;
  List<CinemaDetailsVO>? data;

  GetCinemaResponse(this.code, this.message, this.data);

  factory GetCinemaResponse.fromJson(Map<String, dynamic> json) => _$GetCinemaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCinemaResponseToJson(this);
}