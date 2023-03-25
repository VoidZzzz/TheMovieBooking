// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cities_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCitiesResponse _$GetCitiesResponseFromJson(Map<String, dynamic> json) =>
    GetCitiesResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => CitiesVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCitiesResponseToJson(GetCitiesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
