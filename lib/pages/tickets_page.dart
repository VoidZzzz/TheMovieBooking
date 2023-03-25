import 'package:flutter/material.dart';
import 'package:the_movie_booking/pages/ticket_details_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/widgets/app_bar_image_icon_view.dart';
import 'package:the_movie_booking/widgets/ticket_information_view.dart';

import '../resources/dimens.dart';
import '../widgets/app_bar_city_name_view.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /// App Bar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: MARGIN_SMALLEST,
          backgroundColor: APP_COLOR_PRIMARY_COLOR,
          title: const AppBarTitleView(),
        ),

        /// Body
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: MARGIN_MEDIUM_20X),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TicketDetailsPage(),
                  ),
                ),
                child: const TicketInformationView(
                  ticketCounts: 2,
                  bookingDate: "2023-02-25",
                  startTime: "9:30 AM",
                  selectedSeats: "A-8",
                  movieName: "Avatar",
                  moviePoster:
                      "https://www.themoviedb.org/t/p/original/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
                  cinemaName: "JCTV",
                  cinemaLocation: "/// Cinema Location Here",
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM_25X),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TicketDetailsPage(),
                  ),
                ),
                child: const TicketInformationView(
                  ticketCounts: 2,
                  bookingDate: "2023-02-25",
                  startTime: "9:30 AM",
                  selectedSeats: "A-8",
                  movieName: "Avatar",
                  moviePoster:
                      "https://www.themoviedb.org/t/p/original/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
                  cinemaName: "JCTV",
                  cinemaLocation: "/// Cinema Location Here",
                ),
              ),
              const SizedBox(height: MARGIN_MEDIUM_25X),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TicketDetailsPage(),
                  ),
                ),
                child: const TicketInformationView(
                  ticketCounts: 2,
                  bookingDate: "2023-02-25",
                  startTime: "9:30 AM",
                  selectedSeats: "A-8",
                  movieName: "Avatar",
                  moviePoster:
                      "https://www.themoviedb.org/t/p/original/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
                  cinemaName: "JCTV",
                  cinemaLocation: "/// Cinema Location Here",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarTitleView extends StatelessWidget {
  const AppBarTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Spacer(),
        AppBarImageIconView(SEARCH_ICON_IMAGE),
        SizedBox(width: MARGIN_MEDIUM_30X),
        AppBarImageIconView(NOTI_ICON_IMAGE),
        SizedBox(width: MARGIN_MEDIUM_15X),
        AppBarImageIconView(
          QR_SCAN_ICON_IMAGE,
          imageScale: 3,
          containerHeight: MARGIN_MEDIUM_50X,
          containerWidth: MARGIN_MEDIUM_50X,
        )
      ],
    );
  }
}
