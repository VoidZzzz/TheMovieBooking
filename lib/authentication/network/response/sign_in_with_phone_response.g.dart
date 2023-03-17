// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_with_phone_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignInWithPhoneResponseAdapter
    extends TypeAdapter<SignInWithPhoneResponse> {
  @override
  final int typeId = 3;

  @override
  SignInWithPhoneResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SignInWithPhoneResponse(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as UserInfoVO?,
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SignInWithPhoneResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignInWithPhoneResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
