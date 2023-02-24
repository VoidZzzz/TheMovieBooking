import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';

import '../resources/colors.dart';

class AppSecondaryButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  const AppSecondaryButton({super.key, required this.buttonText, required this.buttonColor, required this.buttonTextColor,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(MARGIN_SMALL_10X),),
        height: MARGIN_MEDIUM_50X,
        width: MARGIN_XLARGE_220X,
        child: Stack(
          children: [
            Align(alignment: Alignment.center,
              child: Text(
                buttonText,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: TEXT_LARGE_16X,
                    color: buttonTextColor),
              ),
            ),
            Positioned(right: -MARGIN_SMALL_1X,top: MARGIN_MEDIUM_15X,
              child: Container(
                height: MARGIN_MEDIUM_20X,
                width: MARGIN_MEDIUM_15X,
                decoration: const BoxDecoration(
                  color: APP_COLOR_PRIMARY_COLOR,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(MARGIN_MEDIUM_15X),
                    bottomLeft: Radius.circular(MARGIN_MEDIUM_15X),
                  ),
                ),
              ),
            ),
            Positioned(left: -MARGIN_SMALL_1X,top: MARGIN_MEDIUM_15X,
              child: Container(
                height: MARGIN_MEDIUM_20X,
                width: MARGIN_MEDIUM_15X,
                decoration: const BoxDecoration(
                  color: APP_COLOR_PRIMARY_COLOR,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(MARGIN_MEDIUM_15X),
                    bottomRight: Radius.circular(MARGIN_MEDIUM_15X),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
