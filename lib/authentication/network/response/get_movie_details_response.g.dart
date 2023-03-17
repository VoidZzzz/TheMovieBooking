// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieDetailsResponse _$GetMovieDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetMovieDetailsResponse(
      json['code'] as int?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : MovieVO.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMovieDetailsResponseToJson(
        GetMovieDetailsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
