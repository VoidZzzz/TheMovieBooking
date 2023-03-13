// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoVO _$UserInfoVOFromJson(Map<String, dynamic> json) => UserInfoVO(
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      (json['total_expense'] as num?)?.toDouble(),
      json['profile_image'] as String?,
    );

Map<String, dynamic> _$UserInfoVOToJson(UserInfoVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'total_expense': instance.totalExpense,
      'profile_image': instance.profileImage,
    };
