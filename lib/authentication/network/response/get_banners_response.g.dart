// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_banners_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBannersResponse _$GetBannersResponseFromJson(Map<String, dynamic> json) =>
    GetBannersResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => BannerVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBannersResponseToJson(GetBannersResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
