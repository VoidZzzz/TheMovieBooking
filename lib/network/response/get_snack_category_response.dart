import 'package:json_annotation/json_annotation.dart';
import '../../data/data_vos/snack_category_vo.dart';

part 'get_snack_category_response.g.dart';

@JsonSerializable()
class GetSnackCategoryResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<SnackCategoryVO>? data;

  GetSnackCategoryResponse(this.code, this.message, this.data);

  factory GetSnackCategoryResponse.fromJson(Map<String, dynamic> json) => _$GetSnackCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSnackCategoryResponseToJson(this);
}