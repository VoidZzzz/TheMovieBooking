import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';

class CensorDateDurationBox extends StatelessWidget {
  final String titleText;
  final String subTitleText;
  final double boxWidth;

  const CensorDateDurationBox(
      {super.key,
      required this.titleText,
      required this.subTitleText,
      required this.boxWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_LARGE_60X,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            MOVIE_DETAILS_PAGE_GRADIENT_COLOR_1,
            MOVIE_DETAILS_PAGE_GRADIENT_COLOR_2
          ],
        ),
        borderRadius: BorderRadius.circular(MARGIN_SMALL_10X),
        boxShadow: const [
          BoxShadow(
              color: MOVIE_DETAILS_PAGE_BOX_SHADOW_COLOR,
              blurRadius: MARGIN_MEDIUM_15X,
              blurStyle: BlurStyle.outer),
        ],
      ),
      width: boxWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleText,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: TEXT_SMALL_12X,
                color: WHITE_COLOR),
          ),
          const SizedBox(
            height: MARGIN_SMALL_10X,
          ),
          Text(
            subTitleText,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: TEXT_MEDIUM,
                color: WHITE_COLOR),
          )
        ],
      ),
    );
  }
}
