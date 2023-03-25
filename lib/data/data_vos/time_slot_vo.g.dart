// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlotsVO _$TimeSlotsVOFromJson(Map<String, dynamic> json) => TimeSlotsVO(
      json['cinema_day_timeslot_id'] as int?,
      json['start_time'] as String?,
      json['status'] as int?,
    );

Map<String, dynamic> _$TimeSlotsVOToJson(TimeSlotsVO instance) =>
    <String, dynamic>{
      'cinema_day_timeslot_id': instance.cinemaDayTimeslotId,
      'start_time': instance.startTime,
      'status': instance.status,
    };
