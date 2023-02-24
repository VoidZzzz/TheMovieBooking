import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';

class TitleText extends StatelessWidget {
  final String titleText;
  const TitleText(this.titleText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: GoogleFonts.dmSans(
          color: WHITE_COLOR,
          fontWeight: FontWeight.w500,
          fontSize: TEXT_LARGE_22X),
    );
  }
}