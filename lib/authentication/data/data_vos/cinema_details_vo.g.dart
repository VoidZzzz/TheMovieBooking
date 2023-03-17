// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_details_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaDetailsVO _$CinemaDetailsVOFromJson(Map<String, dynamic> json) =>
    CinemaDetailsVO(
      json['id'] as int?,
      json['name'] as String?,
      json['phone'] as String?,
      json['email'] as String?,
      json['address'] as String?,
      json['promo_vdo_url'] as String?,
      (json['facilities'] as List<dynamic>?)
          ?.map((e) => CinemaFacilitiesVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['safety'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CinemaDetailsVOToJson(CinemaDetailsVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'promo_vdo_url': instance.promoVdoUrl,
      'facilities': instance.facilities,
      'safety': instance.safety,
    };
