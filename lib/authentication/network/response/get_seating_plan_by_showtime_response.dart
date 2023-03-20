import 'package:json_annotation/json_annotation.dart';
import '../../data/data_vos/seat_vo.dart';

part 'get_seating_plan_by_showtime_response.g.dart';

@JsonSerializable()
class GetSeatingPlanByShowTimeResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<List<SeatVO>?> data;

  GetSeatingPlanByShowTimeResponse(this.code, this.message, this.data);

  factory GetSeatingPlanByShowTimeResponse.fromJson(Map<String, dynamic> json) => _$GetSeatingPlanByShowTimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSeatingPlanByShowTimeResponseToJson(this);
}