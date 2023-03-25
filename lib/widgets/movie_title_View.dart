import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';

import '../resources/colors.dart';
class MovieTitleView extends StatelessWidget {
  const MovieTitleView({
    Key? key,
    required this.movieName
  }) : super(key: key);
  final String movieName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
      child: Text(
        "$movieName (3D) (U/A)",
        style: GoogleFonts.dmSans(
            color: WHITE_COLOR,
            fontWeight: FontWeight.w700,
            fontSize: TEXT_LARGE_18X),
      ),
    );
  }
}
