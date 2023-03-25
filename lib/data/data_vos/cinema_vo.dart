import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking/data/data_vos/time_slot_vo.dart';

part 'cinema_vo.g.dart';

@JsonSerializable()
class CinemaVO{

  @JsonKey(name: "cinema_id")
  int? cinemaId;

  @JsonKey(name: "cinema")
  String? cinema;

  @JsonKey(name: "timeslots")
  List<TimeSlotsVO>? timeSlots;

  bool? isExpanded = false;

  CinemaVO(this.cinemaId, this.cinema, this.timeSlots, this.isExpanded);

  factory CinemaVO.fromJson(Map<String, dynamic> json) => _$CinemaVOFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaVOToJson(this);
}