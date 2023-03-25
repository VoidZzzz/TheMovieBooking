import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import '../resources/colors.dart';

class CinemaNameView extends StatelessWidget {
  const CinemaNameView({
    Key? key,
    required this.cinemaName,
    required this.cinemaStatus
  }) : super(key: key);

  final String cinemaName;
  final String cinemaStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w400, fontSize: TEXT_LARGE_16X, color: APP_COLOR_SECONDARY_COLOR),
          children: [
            TextSpan(text: cinemaName),
            TextSpan(
              text: " (SCREEN $cinemaStatus)",
              style: GoogleFonts.dmSans(color: WHITE_COLOR,fontSize: TEXT_MEDIUM),
            )
          ],
        ),
      ),
    );
  }
}
