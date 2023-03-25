import 'package:json_annotation/json_annotation.dart';
import '../../data/data_vos/checkout_vo.dart';

part 'checkout_response.g.dart';

@JsonSerializable()
class CheckoutResponse{

  int? code;
  String? message;
  CheckoutVO? data;

  CheckoutResponse(this.code, this.message, this.data);

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) => _$CheckoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutResponseToJson(this);

  @override
  String toString() {
    return 'CheckoutResponse{code: $code, message: $message, data: $data}';
  }
}