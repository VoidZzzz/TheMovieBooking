// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMoviesResponse _$GetMoviesResponseFromJson(Map<String, dynamic> json) =>
    GetMoviesResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMoviesResponseToJson(GetMoviesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
