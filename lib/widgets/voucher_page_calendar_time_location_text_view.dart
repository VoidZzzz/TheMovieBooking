import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import '../resources/colors.dart';
class CalendarTImeLocationTextView extends StatelessWidget {
  final String text;
  const CalendarTImeLocationTextView(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.dmSans(
          color: WHITE_COLOR, fontWeight: FontWeight.w400, fontSize: TEXT_MEDIUM),
    );
  }
}