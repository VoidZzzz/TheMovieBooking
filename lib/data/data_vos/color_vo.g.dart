// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ColorVOAdapter extends TypeAdapter<ColorVO> {
  @override
  final int typeId = 5;

  @override
  ColorVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColorVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ColorVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorVO _$ColorVOFromJson(Map<String, dynamic> json) => ColorVO(
      json['id'] as int?,
      json['title'] as String?,
      json['color'] as String?,
    );

Map<String, dynamic> _$ColorVOToJson(ColorVO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'color': instance.color,
    };
