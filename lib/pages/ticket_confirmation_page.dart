import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/bottom_navigation_bar_home_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';
import 'package:the_movie_booking/widgets/app_default_button_small.dart';
import 'package:the_movie_booking/widgets/calendar_time_and_location_view.dart';
import 'package:the_movie_booking/widgets/dotted_line_view.dart';
import 'package:the_movie_booking/widgets/left_semi_circle_view.dart';
import 'package:the_movie_booking/widgets/title_text_green.dart';
import 'package:the_movie_booking/widgets/ticket_count_view.dart';
import 'package:the_movie_booking/widgets/title_text_large.dart';
import 'package:the_movie_booking/widgets/title_text_small.dart';
import 'package:the_movie_booking/widgets/right_semi_circle_view.dart';

import '../resources/dimens.dart';
import '../widgets/ticket_information_view.dart';
import '../widgets/title_text_xlarge.dart';

class TicketConfirmationPage extends StatefulWidget {
  const TicketConfirmationPage({Key? key}) : super(key: key);

  @override
  State<TicketConfirmationPage> createState() => _TicketConfirmationPageState();
}

class _TicketConfirmationPageState extends State<TicketConfirmationPage> {
  bool isShow = true;

  @override
  void initState() {
    super.initState();
    showOverLay();
  }

  showOverLay() async {
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      isShow = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: MARGIN_MEDIUM_20X),
                const TitleTextXLarge(
                    titleText: TICKET_CONFIRMATION_PAGE_TITLE_TEXT),
                const SizedBox(height: MARGIN_MEDIUM_50X),
                const TicketInformationView(),
                const SizedBox(height: MARGIN_LARGE_60X),
                const QRImageView(),
                const SizedBox(height: MARGIN_MEDIUM_20X),
                const TitleTextXLarge(
                  titleText: "WAG5LP1C",
                ),
                const QRPinView(),
                const SizedBox(height: MARGIN_LARGE_60X),
                AppDefaultButtonSmall(
                  buttonText: TICKET_CONFIRMATION_PAGE_BUTTON_TEXT,
                  buttonColor: APP_COLOR_SECONDARY_COLOR,
                  onTappedButton: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BottomNaviBarHomePage(),
                    ),
                  ),
                )
              ],
            ),
            isShow
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: BLUR_COLOR,
                    child: Center(
                      child: SizedBox(
                        height: MARGIN_XLARGE_300X,
                        width: MARGIN_XLARGE_300X,
                        child: Image.asset(CONGRATS_IMAGE, fit: BoxFit.fill),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_20X),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MoviePosterView(),
              const SizedBox(width: MARGIN_MEDIUM_20X),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  MovieNameView(),
                  SizedBox(height: MARGIN_SMALL_10X),
                  CinemaNameView(),
                  SizedBox(height: MARGIN_SMALL_10X),
                  TicketCountView(),
                  SizedBox(height: MARGIN_SMALL_10X),
                  TicketNameView(),
                ],
              )
            ],
          ),
          const SizedBox(height: MARGIN_MEDIUM_35X),
          const DottedLineView(),
          const SizedBox(height: MARGIN_MEDIUM_20X),
          const CalendarTimeAndLocationView()
        ],
      ),
    );
  }
}

class TicketNameView extends StatelessWidget {
  const TicketNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "GOLD-G8, G7",
          style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w700,
              fontSize: TEXT_LARGE_16X,
              color: WHITE_COLOR)),
      TextSpan(
          text: "(SCREEN 2)",
          style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w400,
              fontSize: TEXT_SMALL_12X,
              color: WHITE_COLOR))
    ]));
  }
}

class CinemaNameView extends StatelessWidget {
  const CinemaNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GreenTitleText("JCGV:Junction City");
  }
}

class MovieNameView extends StatelessWidget {
  const MovieNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TitleTextLarge("Avatar (3D)(U/A)");
  }
}

class MoviePosterView extends StatelessWidget {
  const MoviePosterView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: MARGIN_LARGE_100X,
      height: MARGIN_LARGE_100X + MARGIN_MEDIUM_20X,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_SMALL_4X),
      ),
      child: Image.network(
        "https://www.themoviedb.org/t/p/original/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}

class GradientView extends StatelessWidget {
  const GradientView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        TICKET_CONFIRMATION_GRADIENT_IMAGE,
        fit: BoxFit.cover,
      ),
    );
  }
}

class QRImageView extends StatelessWidget {
  const QRImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_LARGE_100X,
      width: MARGIN_LARGE_100X,
      child: Image.asset(
        QR_IMAGE,
        fit: BoxFit.cover,
      ),
    );
  }
}

class QRPinView extends StatelessWidget {
  const QRPinView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w700, fontSize: MARGIN_MEDIUM_20X),
        children: [
          TextSpan(
            text: "TPIN :",
            style: GoogleFonts.dmSans(color: LIGHT_GREY_COLOR),
          ),
          TextSpan(
            text: " WKCSL96",
            style: GoogleFonts.dmSans(color: WHITE_COLOR),
          ),
        ],
      ),
    );
  }
}
