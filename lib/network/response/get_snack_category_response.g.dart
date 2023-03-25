// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_snack_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSnackCategoryResponse _$GetSnackCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    GetSnackCategoryResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => SnackCategoryVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSnackCategoryResponseToJson(
        GetSnackCategoryResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
