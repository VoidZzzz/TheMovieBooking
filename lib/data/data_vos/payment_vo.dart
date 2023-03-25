import 'package:json_annotation/json_annotation.dart';

part 'payment_vo.g.dart';

@JsonSerializable()
class PaymentVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "icon")
  String? icon;

  @JsonKey(name: "created_at")
  String? createdAt;

  @JsonKey(name: "updated_at")
  String? updatedAt;

  @JsonKey(name: "deleted_at")
  dynamic deletedAt;


  PaymentVO(this.id, this.title, this.icon, this.createdAt, this.updatedAt,
      this.deletedAt);

  factory PaymentVO.fromJson(Map<String, dynamic> json) => _$PaymentVOFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentVOToJson(this);
}