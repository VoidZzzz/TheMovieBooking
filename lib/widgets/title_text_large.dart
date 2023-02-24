import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/colors.dart';
import '../resources/dimens.dart';

class TitleTextLarge extends StatelessWidget {
  final String titleText;
  const TitleTextLarge(this.titleText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,maxLines: 1,overflow: TextOverflow.ellipsis,
      style: GoogleFonts.dmSans(
          color: WHITE_COLOR,
          fontWeight: FontWeight.w700,
          fontSize: TEXT_LARGE_18X),
    );
  }
}