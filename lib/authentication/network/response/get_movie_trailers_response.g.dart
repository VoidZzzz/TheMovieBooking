// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_trailers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieTrailersResponse _$GetMovieTrailersResponseFromJson(
        Map<String, dynamic> json) =>
    GetMovieTrailersResponse(
      json['id'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => VideoVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMovieTrailersResponseToJson(
        GetMovieTrailersResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
