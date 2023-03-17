// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastVO _$CastVOFromJson(Map<String, dynamic> json) => CastVO(
      json['adult'] as bool?,
      json['gender'] as int?,
      json['id'] as int?,
      json['known_for_department'] as String?,
      json['name'] as String?,
      json['original_name'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['profile_path'] as String?,
      json['cast_id'] as int?,
      json['character'] as String?,
      json['credit_id'] as String?,
      (json['order'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CastVOToJson(CastVO instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
    };
