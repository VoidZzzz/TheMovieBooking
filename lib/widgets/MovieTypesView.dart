import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTypesView extends StatelessWidget {
  final double movieTypesFontSize;
  final String movieTypesText;
  const MovieTypesView(this.movieTypesFontSize, this.movieTypesText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        movieTypesText,
        maxLines: 2,
        softWrap: true,
        textAlign: TextAlign.start,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: movieTypesFontSize,
            color: Colors.white),
      ),
    );
  }
}