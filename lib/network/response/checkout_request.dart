import 'package:json_annotation/json_annotation.dart';
import '../../data/data_vos/request_snack_vo.dart';

part 'checkout_request.g.dart';

@JsonSerializable()
class CheckOutRequest{

  @JsonKey(name: "cinema_day_timeslot_id")
  int? cinemaDayTimeSlotId;

  @JsonKey(name: "seat_number")
  String? seatNumber;

  @JsonKey(name: "booking_date")
  String? bookingDate;

  @JsonKey(name: "movie_id")
  int? movieId;

  @JsonKey(name: "payment_type_id")
  int? paymentTypeId;

  @JsonKey(name: "snacks")
  List<RequestSnackVO>? snacks;

  CheckOutRequest(this.cinemaDayTimeSlotId, this.seatNumber, this.bookingDate,
      this.movieId, this.paymentTypeId, this.snacks);

  factory CheckOutRequest.fromJson(Map<String, dynamic> json) => _$CheckOutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOutRequestToJson(this);

}