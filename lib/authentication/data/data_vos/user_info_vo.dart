import 'package:json_annotation/json_annotation.dart';

part 'user_info_vo.g.dart';

@JsonSerializable()
class UserInfoVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "total_expense")
  double? totalExpense;

  @JsonKey(name: "profile_image")
  String? profileImage;

  UserInfoVO(this.id, this.name, this.email, this.phone, this.totalExpense,
      this.profileImage);

  factory UserInfoVO.fromJson(Map<String, dynamic> json) => _$UserInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoVOToJson(this);
}

