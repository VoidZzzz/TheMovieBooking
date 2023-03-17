import 'package:json_annotation/json_annotation.dart';
import '../../data/data_vos/payment_vo.dart';

part 'get_payment_types_response.g.dart';

@JsonSerializable()
class GetPaymentTypesResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<PaymentVO>? data;

  GetPaymentTypesResponse(this.code, this.message, this.data);

  factory GetPaymentTypesResponse.fromJson(Map<String, dynamic> json) => _$GetPaymentTypesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentTypesResponseToJson(this);


}