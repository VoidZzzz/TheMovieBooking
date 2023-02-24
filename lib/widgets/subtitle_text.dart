import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/colors.dart';

import '../resources/dimens.dart';

class SubtitleText extends StatelessWidget {
  final String subtitleText;
  const SubtitleText(this.subtitleText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitleText,
      textAlign: TextAlign.center,
      style:
      GoogleFonts.dmSans(color: GREY_COLOR, fontSize: TEXT_MEDIUM),
    );
  }
}