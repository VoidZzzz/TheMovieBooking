import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';

import '../resources/colors.dart';

class TicketNameAndAmountView extends StatelessWidget {
  const TicketNameAndAmountView({
    Key? key,
    required this.totalAmountsForTickets,
    required this.seatNames
  }) : super(key: key);
  final int totalAmountsForTickets;
  final String seatNames;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: MARGIN_XLARGE_220X,
            child: Text(
              (seatNames.isNotEmpty)?  "Normal ($seatNames)": "-",
              textAlign: TextAlign.start,
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700, fontSize: TEXT_LARGE_16X, color: WHITE_COLOR),
            ),
          ),
          Text(
            (totalAmountsForTickets > 0)? "${totalAmountsForTickets.toString() } Ks": "-",
            style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700, fontSize: TEXT_LARGE_16X, color: WHITE_COLOR),
          )
        ],
      ),
    );
  }
}