import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/widgets/voucher_page_calendar_time_location_glow_icon_view.dart';
import 'package:the_movie_booking/widgets/voucher_page_calendar_time_location_text_view.dart';
import '../pages/check_out_page.dart';
class CalendarTimeAndLocationView extends StatelessWidget {
  const CalendarTimeAndLocationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MARGIN_LARGE_110X,
          height: MARGIN_LARGE_100X,
          child: Column(
            children: const [
              CalendarTimeLocationGlowIconView(Icons.calendar_month_outlined),
              SizedBox(height: MARGIN_SMALL_10X),
              CalendarTImeLocationTextView("SAT, 20 Feb, 2023")
            ],
          ),
        ),
        SizedBox(
          width: MARGIN_LARGE_70X,
          height: MARGIN_LARGE_100X,
          child: Column(
            children: const [
              CalendarTimeLocationGlowIconView(Icons.access_time),
              SizedBox(height: MARGIN_SMALL_10X),
              CalendarTImeLocationTextView("3:30PM")
            ],
          ),
        ),
        SizedBox(
          width: MARGIN_LARGE_120X,
          height: MARGIN_LARGE_106X,
          child: Column(
            children: const [
              CalendarTimeLocationGlowIconView(Icons.location_on),
              SizedBox(height: MARGIN_SMALL_10X),
              CalendarTImeLocationTextView(
                  "Q5H3+JPP, Corner of Bogyoke Lann, Yangon")
            ],
          ),
        ),
      ],
    );
  }
}