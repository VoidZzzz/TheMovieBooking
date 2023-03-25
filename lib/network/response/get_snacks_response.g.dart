// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_snacks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSnacksResponse _$GetSnacksResponseFromJson(Map<String, dynamic> json) =>
    GetSnacksResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => SnackVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSnacksResponseToJson(GetSnacksResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
