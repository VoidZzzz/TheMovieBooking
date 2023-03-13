// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_with_phone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInWithPhoneResponse _$SignInWithPhoneResponseFromJson(
        Map<String, dynamic> json) =>
    SignInWithPhoneResponse(
      json['code'] as int?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : UserInfoVO.fromJson(json['data'] as Map<String, dynamic>),
      json['token'] as String?,
    );

Map<String, dynamic> _$SignInWithPhoneResponseToJson(
        SignInWithPhoneResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'token': instance.token,
    };
