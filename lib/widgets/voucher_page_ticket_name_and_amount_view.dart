import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';

import '../resources/colors.dart';

class TicketNameAndAmountView extends StatelessWidget {
  const TicketNameAndAmountView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Gold-G8,G7",
          style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w700, fontSize: TEXT_LARGE_16X, color: WHITE_COLOR),
        ),
        Text(
          "20000Ks",
          style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w700, fontSize: TEXT_LARGE_16X, color: WHITE_COLOR),
        )
      ],
    );
  }
}