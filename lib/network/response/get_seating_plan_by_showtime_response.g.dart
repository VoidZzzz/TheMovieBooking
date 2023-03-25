// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_seating_plan_by_showtime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSeatingPlanByShowTimeResponse _$GetSeatingPlanByShowTimeResponseFromJson(
        Map<String, dynamic> json) =>
    GetSeatingPlanByShowTimeResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>)
          .map((e) => (e as List<dynamic>?)
              ?.map((e) => SeatVO.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$GetSeatingPlanByShowTimeResponseToJson(
        GetSeatingPlanByShowTimeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
