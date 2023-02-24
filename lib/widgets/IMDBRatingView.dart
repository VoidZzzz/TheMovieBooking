import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/dimens.dart';

class IMDBRatingView extends StatelessWidget {

  final double ratingFontSize;
  final String ratingText;
  const IMDBRatingView(this.ratingFontSize, this.ratingText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ratingText,
      style: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          fontSize: ratingFontSize,
          color: Colors.white),
    );
  }
}