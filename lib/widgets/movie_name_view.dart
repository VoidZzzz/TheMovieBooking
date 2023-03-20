import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/dimens.dart';

class MovieNameView extends StatelessWidget {
  final double movieNameFontSize;
  final String movieName;
  const MovieNameView(this.movieNameFontSize,this.movieName,{super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MARGIN_LARGE_100X,
      child: Text(
        movieName,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
          maxLines: 2,
        style: GoogleFonts.inter(
            fontSize: movieNameFontSize,
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
    );
  }
}