import 'package:json_annotation/json_annotation.dart';

part 'time_slot_vo.g.dart';

@JsonSerializable()
class TimeSlotsVO{

  @JsonKey(name: "cinema_day_timeslot_id")
  int? cinemaDayTimeslotId;

  @JsonKey(name: "start_time")
  String? startTime;

  @JsonKey(name: "status")
  int? status;

  String? color;

  TimeSlotsVO(this.cinemaDayTimeslotId, this.startTime, this.status,this.color,);

  factory TimeSlotsVO.fromJson(Map<String, dynamic> json) => _$TimeSlotsVOFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotsVOToJson(this);
}