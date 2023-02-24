import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/colors.dart';

class CinemaNameView extends StatelessWidget {
  const CinemaNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w400, color: APP_COLOR_SECONDARY_COLOR),
        children: [
          const TextSpan(text: "JCGV : Junction City"),
          TextSpan(
            text: " (SCREEN 2)",
            style: GoogleFonts.dmSans(color: WHITE_COLOR),
          )
        ],
      ),
    );
  }
}
