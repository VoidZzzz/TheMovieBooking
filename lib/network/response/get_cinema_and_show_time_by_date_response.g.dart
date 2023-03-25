// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cinema_and_show_time_by_date_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCinemaAndShowTimeByDateResponse _$GetCinemaAndShowTimeByDateResponseFromJson(
        Map<String, dynamic> json) =>
    GetCinemaAndShowTimeByDateResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => CinemaVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCinemaAndShowTimeByDateResponseToJson(
        GetCinemaAndShowTimeByDateResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
