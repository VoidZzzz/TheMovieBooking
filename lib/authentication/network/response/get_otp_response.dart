import 'package:json_annotation/json_annotation.dart';

part 'get_otp_response.g.dart';

@JsonSerializable()
class GetOTPResponse{
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  GetOTPResponse(this.code, this.message);

  factory GetOTPResponse.fromJson(Map<String, dynamic> json) => _$GetOTPResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOTPResponseToJson(this);
}