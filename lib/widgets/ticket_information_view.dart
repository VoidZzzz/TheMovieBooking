import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/widgets/right_semi_circle_view.dart';
import '../pages/ticket_confirmation_page.dart';
import 'left_semi_circle_view.dart';

class TicketInformationView extends StatelessWidget {
  const TicketInformationView(
      {Key? key,
      required this.ticketCounts,
      required this.startTime,
      required this.selectedSeats,
      required this.bookingDate,
      required this.cinemaName,
      required this.movieName,
      required this.moviePoster,
      required this.cinemaLocation})
      : super(key: key);

  final int ticketCounts;
  final String bookingDate;
  final String selectedSeats;
  final String startTime;
  final String movieName;
  final String moviePoster;
  final String cinemaName;
  final String cinemaLocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            const GradientView(),
            TicketDetailsView(
              cinemaName: cinemaName,
              movieName: movieName,
              moviePoster: moviePoster,
              ticketCounts: ticketCounts,
              selectedSeats: selectedSeats,
              bookingDate: bookingDate,
              startTime: startTime,
              cinemaLocation: cinemaLocation,
            ),
            const Positioned(
              left: MARGIN_SMALLEST,
              bottom: MARGIN_LARGE_125X,
              child: LeftSemiCircleContainer(),
            ),
            const Positioned(
              bottom: MARGIN_LARGE_125X,
              right: MARGIN_SMALLEST,
              child: RightSemiCircleContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
