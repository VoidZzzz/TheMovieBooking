import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';

import '../resources/colors.dart';

class SearchFilterOptionsView extends StatelessWidget {
  final String text;
  const SearchFilterOptionsView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_MEDIUM_30X,
      width: MARGIN_LARGE_80X,
      decoration: BoxDecoration(
        color: WHITE_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400, color: BLACK_COLOR),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: BLACK_COLOR,
            size: MARGIN_MEDIUM_15X,
          )
        ],
      ),
    );
  }
}
