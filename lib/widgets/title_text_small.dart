import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/dimens.dart';

class TitleTextSmall extends StatelessWidget {
  final String titleText;
  const TitleTextSmall(this.titleText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: GoogleFonts.dmSans(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: TEXT_SMALL_12X),
    );
  }
}