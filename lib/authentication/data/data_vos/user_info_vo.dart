import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_booking/authentication/persistence/hive_constants.dart';
part 'user_info_vo.g.dart';


@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_USER_INFO_VO, adapterName: "UserInfoVOAdapter")
class UserInfoVO{

  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  @JsonKey(name: "email")
  @HiveField(2)
  String? email;

  @JsonKey(name: "phone")
  @HiveField(3)
  String? phone;

  @JsonKey(name: "total_expense")
  @HiveField(4)
  double? totalExpense;

  @JsonKey(name: "profile_image")
  @HiveField(5)
  String? profileImage;



  UserInfoVO(this.id, this.name, this.email, this.phone, this.totalExpense,
      this.profileImage);

  factory UserInfoVO.fromJson(Map<String, dynamic> json) => _$UserInfoVOFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoVOToJson(this);
}

