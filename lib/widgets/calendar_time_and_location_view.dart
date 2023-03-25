import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_booking/authentication/data/data_vos/cinema_details_vo.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_booking_model.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_booking_model_impl.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/widgets/voucher_page_calendar_time_location_glow_icon_view.dart';
import 'package:the_movie_booking/widgets/voucher_page_calendar_time_location_text_view.dart';
import '../pages/check_out_page.dart';

class CalendarTimeAndLocationView extends StatefulWidget {
  const CalendarTimeAndLocationView(
      {Key? key,
      required this.selectedDate,
      required this.selectedTime,
      required this.cinemaLocation,
      required this.selectedDateTime})
      : super(key: key);

  final String selectedDate;
  final String selectedTime;
  final String cinemaLocation;
  final DateTime selectedDateTime;

  @override
  State<CalendarTimeAndLocationView> createState() =>
      _CalendarTimeAndLocationViewState();
}

class _CalendarTimeAndLocationViewState
    extends State<CalendarTimeAndLocationView> {
  final TheMovieBookingModel _movieBookingModel = TheMovieBookingModelImpl();
  var today = DateTime.now();
  List<CinemaDetailsVO>? cinemaList;
  String? userToken;
  late String latestTime =
      "${today.year}-${today.month}-${today.day} ${today.hour}:${today.minute}:${today.second}";

  @override
  void initState() {
    setState(() {
      userToken = _movieBookingModel.getUserDataFromDatabase()?.token;
    });

    _movieBookingModel
        .getCinemas(latestTime, "Bearer $userToken")
        .then((response) {
      setState(() {
        cinemaList = response.data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MARGIN_LARGE_110X,
          height: MARGIN_LARGE_100X,
          child: Column(
            children: [
              const CalendarTimeLocationGlowIconView(
                  Icons.calendar_month_outlined),
              const SizedBox(height: MARGIN_SMALL_10X),
              CalendarTImeLocationTextView(
                (widget.selectedDate.isNotEmpty)
                    ? DateFormat('E, MMM d, yyyy').format(widget.selectedDateTime)
                    : DateFormat('E, MMM d, yyyy').format(DateTime.now()),
              )
            ],
          ),
        ),
        SizedBox(
          width: MARGIN_LARGE_70X,
          height: MARGIN_LARGE_100X,
          child: Column(
            children: [
              const CalendarTimeLocationGlowIconView(Icons.access_time),
              const SizedBox(height: MARGIN_SMALL_10X),
              CalendarTImeLocationTextView(widget.selectedTime)
            ],
          ),
        ),
        SizedBox(
          width: MARGIN_LARGE_120X,
          height: MARGIN_LARGE_106X,
          child: Column(
            children: [
              const CalendarTimeLocationGlowIconView(Icons.location_on),
              const SizedBox(height: MARGIN_SMALL_10X),
              CalendarTImeLocationTextView(widget.cinemaLocation)
            ],
          ),
        ),
      ],
    );
  }
}
