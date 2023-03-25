import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/strings.dart';

import '../resources/colors.dart';
class ConvenienceFeeView extends StatelessWidget {
  const ConvenienceFeeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                CHECKOUT_PAGE_CONVENIENCE_FEE_TEXT,
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w500,
                    fontSize: TEXT_LARGE_16X,
                    color: WHITE_COLOR),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                size: MARGIN_MEDIUM_20X,
                color: WHITE_COLOR,
              )
            ],
          ),
          Text(
            "500Ks",
            style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w500, fontSize: TEXT_LARGE_16X, color: WHITE_COLOR),
          )
        ],
      ),
    );
  }
}