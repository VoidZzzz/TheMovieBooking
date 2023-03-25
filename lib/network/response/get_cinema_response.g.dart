// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cinema_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCinemaResponse _$GetCinemaResponseFromJson(Map<String, dynamic> json) =>
    GetCinemaResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => CinemaDetailsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCinemaResponseToJson(GetCinemaResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
