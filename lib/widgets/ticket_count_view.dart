import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import '../resources/colors.dart';

class TicketCountView extends StatelessWidget {
  const TicketCountView({
    Key? key,
    required this.ticketCounts
  }) : super(key: key);
  final int ticketCounts;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.dmSans(
            fontSize: TEXT_MEDIUM,
            fontWeight: FontWeight.w700,
            color: VOUCHER_CONFIRMATION_Page_MTICKETS_COLOR),
        children: [
          const TextSpan(text: "M-Tickets("),
          TextSpan(
              text: (ticketCounts > 0)?ticketCounts.toString() : "-",
              style: GoogleFonts.dmSans(color: APP_COLOR_SECONDARY_COLOR)),
          const TextSpan(text: ")")
        ],
      ),
    );
  }
}
