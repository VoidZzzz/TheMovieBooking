import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';

class TitleTextXLarge extends StatelessWidget {
  final String titleText;
  const TitleTextXLarge({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: GoogleFonts.dmSans(
          fontWeight: FontWeight.w700, color: WHITE_COLOR, fontSize: MARGIN_MEDIUM_20X),
    );
  }
}