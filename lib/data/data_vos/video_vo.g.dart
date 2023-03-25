// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoVO _$VideoVOFromJson(Map<String, dynamic> json) => VideoVO(
      json['iso_639_1'] as String?,
      json['iso_3166_1'] as String?,
      json['name'] as String?,
      json['key'] as String?,
      json['site'] as String?,
      json['size'] as int?,
      json['type'] as String?,
      json['official'] as bool?,
      json['published_at'] as String?,
      json['id'] as String?,
    );

Map<String, dynamic> _$VideoVOToJson(VideoVO instance) => <String, dynamic>{
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt,
      'id': instance.id,
    };
