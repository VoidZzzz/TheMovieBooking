import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_booking_model_impl.dart';
import 'package:the_movie_booking/authentication/network/api_constants.dart';
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

import '../authentication/data/data_vos/checkout_vo.dart';
import '../authentication/data/data_vos/movie_vo.dart';
import '../resources/dimens.dart';
import '../widgets/ticket_information_view.dart';
import '../widgets/title_text_xlarge.dart';
import '../widgets/voucher_page_calendar_time_location_glow_icon_view.dart';
import '../widgets/voucher_page_calendar_time_location_text_view.dart';

class TicketConfirmationPage extends StatefulWidget {
  const TicketConfirmationPage(
      {Key? key,
      required this.checkoutList,
      required this.cinemaName,
      required this.cinemaLocation})
      : super(key: key);
  final CheckoutVO? checkoutList;
  final String cinemaName;
  final String cinemaLocation;

  @override
  State<TicketConfirmationPage> createState() => _TicketConfirmationPageState();
}

class _TicketConfirmationPageState extends State<TicketConfirmationPage> {
  bool isShow = true;
  MovieVO? movieDetails;
  final TheMovieBookingModelImpl _movieModel = TheMovieBookingModelImpl();

  @override
  void initState() {
    showOverLay();

    /// get MovieDetails from Network
    _movieModel
        .getMovieDetails(widget.checkoutList?.movieId ?? 0)
        .then((response) {
      movieDetails = response.data;
    });

    print(widget.checkoutList?.qrCode);
    super.initState();
  }

  showOverLay() async {
    await Future.delayed(const Duration(seconds: 2));
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
                const SizedBox(height: MARGIN_MEDIUM_40X),
                (movieDetails != null)
                    ? TicketInformationView(
                        cinemaLocation: widget.cinemaLocation,
                        cinemaName: widget.cinemaName,
                        movieName: movieDetails?.originalTitle ?? "",
                        moviePoster: movieDetails?.posterPath ?? "",
                        ticketCounts: widget.checkoutList?.totalSeat ?? 0,
                        bookingDate: widget.checkoutList?.bookingDate ?? "",
                        selectedSeats: widget.checkoutList?.seat ?? "",
                        startTime:
                            widget.checkoutList?.timeslot?.startTime ?? "",
                      )
                    : const SizedBox(
                        height: MARGIN_XLARGE_300X,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: APP_COLOR_SECONDARY_COLOR,
                          ),
                        ),
                      ),
                const SizedBox(height: MARGIN_LARGE_70X),
                QRImageView(
                  qrCode: widget.checkoutList?.qrCode ?? "",
                ),
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
  const TicketDetailsView(
      {Key? key,
      required this.ticketCounts,
      required this.bookingDate,
      required this.selectedSeats,
      required this.startTime,
      required this.moviePoster,
      required this.movieName,
      required this.cinemaName,
      required this.cinemaLocation})
      : super(key: key);

  final int ticketCounts;
  final String selectedSeats;
  final String startTime;
  final String bookingDate;
  final String movieName;
  final String cinemaName;
  final String moviePoster;
  final String cinemaLocation;

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MoviePosterView(
                moviePoster: moviePoster,
              ),
              const SizedBox(width: MARGIN_MEDIUM_20X),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MovieNameView(
                    movieName: movieName,
                  ),
                  const SizedBox(height: MARGIN_SMALL_8X),
                  CinemaNameView(
                    cinemaName: cinemaName,
                  ),
                  const SizedBox(height: MARGIN_SMALL_10X),
                  TicketCountView(
                    ticketCounts: ticketCounts,
                  ),
                  const SizedBox(height: MARGIN_SMALL_10X),
                  TicketNameView(
                    seat: selectedSeats,
                  ),
                  const SizedBox(height: MARGIN_SMALL_10X),
                ],
              )
            ],
          ),
          const SizedBox(height: MARGIN_MEDIUM_35X),
          const DottedLineView(),
          const SizedBox(height: MARGIN_MEDIUM_20X),
          CinemaDetailsView(bookingDate: bookingDate, startTime: startTime, cinemaLocation: cinemaLocation)
        ],
      ),
    );
  }
}

class CinemaDetailsView extends StatelessWidget {
  const CinemaDetailsView({
    Key? key,
    required this.bookingDate,
    required this.startTime,
    required this.cinemaLocation,
  }) : super(key: key);

  final String bookingDate;
  final String startTime;
  final String cinemaLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MARGIN_LARGE_110X,
          height: MARGIN_LARGE_100X,
          child: Column(
            children: [
              const CalendarTimeLocationGlowIconView(
                  Icons.calendar_month_outlined),
              const SizedBox(height: MARGIN_SMALL_10X),
              CalendarTImeLocationTextView(
                DateFormat('E, MMM d, yyyy')
                    .format(DateTime.parse(bookingDate)),
              )
            ],
          ),
        ),
        SizedBox(
          width: MARGIN_LARGE_70X,
          height: MARGIN_LARGE_100X,
          child: Column(
            children: [
              const CalendarTimeLocationGlowIconView(Icons.access_time),
              const SizedBox(height: MARGIN_SMALL_10X),
              CalendarTImeLocationTextView(startTime)
            ],
          ),
        ),
        SizedBox(
          width: MARGIN_LARGE_120X,
          height: MARGIN_LARGE_106X,
          child: Column(
            children: [
              const CalendarTimeLocationGlowIconView(Icons.location_on),
              const SizedBox(height: MARGIN_SMALL_10X),
              CalendarTImeLocationTextView(cinemaLocation)
            ],
          ),
        ),
      ],
    );
  }
}

class TicketNameView extends StatelessWidget {
  const TicketNameView({Key? key, required this.seat}) : super(key: key);

  final String seat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_MEDIUM_40X,
      width: MARGIN_LARGE_180X + MARGIN_SMALL_10X,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: seat,
            style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w700,
                fontSize: TEXT_LARGE_16X,
                color: WHITE_COLOR)),
        TextSpan(
            text: " (SCREEN 2)",
            style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w400,
                fontSize: TEXT_SMALL_12X,
                color: WHITE_COLOR))
      ])),
    );
  }
}

class CinemaNameView extends StatelessWidget {
  const CinemaNameView({Key? key, required this.cinemaName}) : super(key: key);
  final String cinemaName;

  @override
  Widget build(BuildContext context) {
    return GreenTitleText(cinemaName);
  }
}

class MovieNameView extends StatelessWidget {
  const MovieNameView({Key? key, required this.movieName}) : super(key: key);
  final String movieName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MARGIN_LARGE_180X + MARGIN_SMALL_10X,
      height: MARGIN_MEDIUM_50X,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          "$movieName (3D) (U/A)",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.dmSans(
              color: WHITE_COLOR,
              fontWeight: FontWeight.w700,
              fontSize: TEXT_LARGE_18X),
        ),
      ),
    );
  }
}

class MoviePosterView extends StatelessWidget {
  const MoviePosterView({Key? key, required this.moviePoster})
      : super(key: key);
  final String? moviePoster;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: MARGIN_LARGE_100X,
      height: MARGIN_LARGE_140X,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_SMALL_4X),
      ),
      child: Image.network(
        "$IMAGE_BASE_URL$moviePoster",
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
  const QRImageView({Key? key, required this.qrCode}) : super(key: key);
  final String qrCode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_LARGE_100X,
      width: MARGIN_LARGE_100X,
      child: Image.asset(
        "images/qrImage.png",
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
