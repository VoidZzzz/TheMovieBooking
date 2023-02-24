import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/colors.dart';

import '../resources/dimens.dart';
class GreenTitleText extends StatelessWidget {
  final String titleText;
  const GreenTitleText(this.titleText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: GoogleFonts.dmSans(
          color: APP_COLOR_SECONDARY_COLOR,
          fontWeight: FontWeight.w400,
          fontSize: TEXT_LARGE_16X),
    );
  }
}