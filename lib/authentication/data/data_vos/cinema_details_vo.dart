import 'package:json_annotation/json_annotation.dart';
import 'cinema_facilities_vo.dart';

part 'cinema_details_vo.g.dart';

@JsonSerializable()
class CinemaDetailsVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "promo_vdo_url")
  String? promoVdoUrl;

  @JsonKey(name: "facilities")
  List<CinemaFacilitiesVO>? facilities;

  @JsonKey(name: "safety")
  List<String>? safety;

  CinemaDetailsVO(this.id, this.name, this.phone, this.email, this.address,
      this.promoVdoUrl, this.facilities, this.safety);

  factory CinemaDetailsVO.fromJson(Map<String, dynamic> json) => _$CinemaDetailsVOFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaDetailsVOToJson(this);
}