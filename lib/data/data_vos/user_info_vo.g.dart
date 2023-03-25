// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoVOAdapter extends TypeAdapter<UserInfoVO> {
  @override
  final int typeId = 4;

  @override
  UserInfoVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfoVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as double?,
      fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserInfoVO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.totalExpense)
      ..writeByte(5)
      ..write(obj.profileImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
