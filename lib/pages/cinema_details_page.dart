import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/authentication/data/data_vos/cinema_details_vo.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_booking_model_impl.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';
import 'package:the_movie_booking/video_players/network_video_player_movie.dart';
import 'package:the_movie_booking/widgets/app_bar_back_arrow.dart';
import 'package:the_movie_booking/widgets/location_page_location_box.dart';
import 'package:the_movie_booking/widgets/title_text_large.dart';
import '../authentication/data/data_vos/cinema_vo.dart';
import '../authentication/data/models/the_movie_booking_model.dart';
import '../resources/dimens.dart';
import '../video_players/network_video_player_cinema.dart';
import '../widgets/play_button_view.dart';
import '../widgets/title_text_xlarge.dart';

class CinemaDetailsPage extends StatefulWidget {
  const CinemaDetailsPage({super.key});

  @override
  State<CinemaDetailsPage> createState() => _CinemaDetailsPageState();
}

class _CinemaDetailsPageState extends State<CinemaDetailsPage> {
  final List<String> safetyList = [
    "Thermal Scanning",
    "Contactless Security Check",
    "Sanitization Before Every Show",
    "Disposable 3D Glass",
    "Contactless Food Service",
    "Package Food",
    "Deep Cleaning Of Rest Room"
  ];

  /// Network variable
  final TheMovieBookingModel _movieBookingModel = TheMovieBookingModelImpl();
  String latestTime =
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
  List<CinemaDetailsVO>? cinemaDetailsList;

  @override
  void initState() {
    // _movieBookingModel.getCinemas("2023-03-17 17:01:17", ).then((response) {
    //   setState(() {
    //     cinemaDetailsList = response.data ?? [];
    //     print(
    //         "==============================================> CINEMA DETAILS LIST ${cinemaDetailsList?[1].name}");
    //   });
    // }).catchError((error) {
    //   print("========================================================> $error");
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: MARGIN_SMALLEST,
        backgroundColor: APP_COLOR_PRIMARY_COLOR,
        leading: const AppBarLeadingView(),
        centerTitle: true,
        title: const AppBarTitleView(),
        actions: const [
          AppBarActionView(),
        ],
      ),

      /// Body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CinemaIntroVideoView(),
          const SizedBox(height: MARGIN_MEDIUM_20X),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CinemaNameView(),
                const SizedBox(height: MARGIN_MEDIUM_20X),
                const CinemaLocationView(),
                const SizedBox(height: MARGIN_MEDIUM_40X),
                const FacilityView(),
                const SizedBox(height: MARGIN_MEDIUM_40X),
                SafetyView(safetyList: safetyList)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CinemaNameView extends StatelessWidget {
  const CinemaNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "JCGV:Junction City",
      style: GoogleFonts.dmSans(
          color: WHITE_COLOR,
          fontWeight: FontWeight.w600,
          fontSize: MARGIN_MEDIUM_18X),
    );
  }
}

class AppBarActionView extends StatelessWidget {
  const AppBarActionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MARGIN_MEDIUM_50X,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_SMALL_10X,
            vertical: MARGIN_MEDIUM_12X + MARGIN_SMALL_1X),
        child: Image.asset(
          STAR_IMAGE,
          fit: BoxFit.fill,
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
    return const TitleTextXLarge(titleText: CINEMA_DETAILS_PAGE_TITLE_TEXT);
  }
}

class AppBarLeadingView extends StatelessWidget {
  const AppBarLeadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppBarBackArrow(
      iconSize: MARGIN_MEDIUM_20X,
    );
  }
}

class CinemaLocationView extends StatelessWidget {
  const CinemaLocationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        CinemaLocationTextView(),
        Spacer(),
        CinemaLocationIconView()
      ],
    );
  }
}

class CinemaLocationIconView extends StatelessWidget {
  const CinemaLocationIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      LOCATION_IMAGE,
      fit: BoxFit.cover,
      color: APP_COLOR_SECONDARY_COLOR,
      scale: 1.7,
    );
  }
}

class CinemaLocationTextView extends StatelessWidget {
  const CinemaLocationTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_MEDIUM_50X,
      width: MARGIN_LARGE_70X + MARGIN_XLARGE_200X,
      child: Text(
        "Q5H3+JPP, Corner of Bogyoke Lann, Yangon",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.dmSans(
            color: WHITE_COLOR,
            fontWeight: FontWeight.w600,
            fontSize: MARGIN_MEDIUM_18X),
      ),
    );
  }
}

class FacilityView extends StatelessWidget {
  const FacilityView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        FacilityTitleTextView(),
        SizedBox(height: MARGIN_MEDIUM_20X),
        FacilityContentsView(),
      ],
    );
  }
}

class FacilityContentsView extends StatelessWidget {
  const FacilityContentsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: MARGIN_SMALL_10X,
      spacing: -MARGIN_SMALL_10X,
      children: const [
        FacilityButtonView(
            imageURL: PARKING_IMAGE, text: CINEMA_DETAILS_PAGE_PARKING_TEXT),
        FacilityButtonView(
            imageURL: CART_ITEM_COUNTS_IMAGE,
            text: CINEMA_DETAILS_PAGE_ONLINE_FOOD_TEXT),
        FacilityButtonView(
            imageURL: WHEEL_CHAIR_IMAGE,
            text: CINEMA_DETAILS_PAGE_WHEEL_CHAIR_TEXT),
        FacilityButtonView(
            imageURL: TICKET_CANCEL_IMAGE,
            text: CINEMA_DETAILS_PAGE_TICKET_CANCELLATION_TEXT),
      ],
    );
  }
}

class FacilityTitleTextView extends StatelessWidget {
  const FacilityTitleTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      CINEMA_DETAILS_PAGE_FACILITIES_TEXT,
      style: GoogleFonts.dmSans(
          color: WHITE_COLOR,
          fontWeight: FontWeight.w600,
          fontSize: MARGIN_MEDIUM_18X),
    );
  }
}

class SafetyView extends StatelessWidget {
  const SafetyView({
    Key? key,
    required this.safetyList,
  }) : super(key: key);

  final List<String> safetyList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SafetyTextTitleView(),
        const SizedBox(height: MARGIN_SMALL_5X),
        SafetyContentsChipView(safetyList: safetyList)
      ],
    );
  }
}

class SafetyContentsChipView extends StatelessWidget {
  const SafetyContentsChipView({
    Key? key,
    required this.safetyList,
  }) : super(key: key);

  final List<String> safetyList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: -MARGIN_SMALL_8X,
      children: safetyList
          .map(
            (chips) => Padding(
              padding: const EdgeInsets.only(right: MARGIN_SMALL_5X),
              child: Chip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MARGIN_SMALL_4X),
                ),
                labelPadding: const EdgeInsets.symmetric(
                    horizontal: MARGIN_SMALL_4X, vertical: -MARGIN_SMALL_2X),
                backgroundColor: APP_COLOR_SECONDARY_COLOR,
                label: Text(
                  chips,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class SafetyTextTitleView extends StatelessWidget {
  const SafetyTextTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      CINEMA_DETAILS_PAGE_SAFETY_TEXT,
      style: GoogleFonts.dmSans(
          color: WHITE_COLOR,
          fontWeight: FontWeight.w600,
          fontSize: TEXT_LARGE_18X),
    );
  }
}

class FacilityButtonView extends StatelessWidget {
  final String imageURL;
  final String text;

  const FacilityButtonView(
      {super.key, required this.imageURL, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: MARGIN_SMALL_10X),
      child: Container(
        height: MARGIN_MEDIUM_20X,
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_5X),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MARGIN_MEDIUM_20X,
              width: MARGIN_MEDIUM_20X,
              child: Image.asset(
                imageURL,
                color: APP_COLOR_SECONDARY_COLOR,
              ),
            ),
            const SizedBox(width: MARGIN_SMALL_5X),
            Text(
              text,
              style: GoogleFonts.inter(
                  fontSize: TEXT_MEDIUM,
                  fontWeight: FontWeight.w500,
                  color: APP_COLOR_SECONDARY_COLOR),
            )
          ],
        ),
      ),
    );
  }
}

class CinemaIntroVideoView extends StatelessWidget {
  const CinemaIntroVideoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_XLARGE_200X,
      color: WHITE_COLOR,
      child: Stack(
        children: const [
          Positioned.fill(
            child: NetworkVideoPlayerCinema(),
          ),
        ],
      ),
    );
  }
}
