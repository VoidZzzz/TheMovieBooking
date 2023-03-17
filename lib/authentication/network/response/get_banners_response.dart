import 'package:json_annotation/json_annotation.dart';
import '../../data/data_vos/banner_vo.dart';

part 'get_banners_response.g.dart';

@JsonSerializable()
class GetBannersResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<BannerVO>? data;

  GetBannersResponse(this.code, this.message, this.data);

  factory GetBannersResponse.fromJson(Map<String, dynamic> json) => _$GetBannersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBannersResponseToJson(this);
}