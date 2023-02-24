import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/strings.dart';

import '../resources/colors.dart';
class TicketCancellationPolicyView extends StatelessWidget {
  final Function onTapCancellation;
  final Color buttonColor;
  const TicketCancellationPolicyView(
      {super.key, required this.onTapCancellation, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCancellation();
      },
      child: Container(
        height: MARGIN_MEDIUM_30X,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM_20X),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_10X),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.info_outline_rounded,
                color: WHITE_COLOR,
                size: MARGIN_MEDIUM_20X,
              ),
              const SizedBox(width: MARGIN_SMALL_5X),
              Text(
                VOUCHER_PAGE_TICKET_CANCELLAION_POLICY_TEXT,
                style: GoogleFonts.dmSans(
                    color: WHITE_COLOR, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}