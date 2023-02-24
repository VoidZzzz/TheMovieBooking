import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/cinema_selection_page.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/video_players/asset_video_player.dart';
import 'package:the_movie_booking/video_players/network_video_player_movie.dart';
import 'package:the_movie_booking/widgets/censor_date_duration_box.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../widgets/IMDBRatingView.dart';
import '../widgets/MovieTypesView.dart';
import '../widgets/app_secondary_button.dart';
import '../widgets/back_button_view.dart';
import '../widgets/imdb_view.dart';
import '../widgets/movie_name_view.dart';
import '../widgets/play_button_view.dart';
import '../widgets/share_button_view.dart';
import '../widgets/subtitle_text.dart';
import '../widgets/title_text.dart';

class MovieDetailsPage extends StatelessWidget {
  final bool isVisible;

  const MovieDetailsPage({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * MARGIN_XSMALL,
                child: DetailsPageTopView(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: DetailsPageBottomView(isVisible: isVisible),
              )
            ],
          ),
        ),
        floatingActionButton: const FloatingActionButtonView(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class FloatingActionButtonView extends StatelessWidget {
  const FloatingActionButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSecondaryButton(
      buttonText: MOVIE_DETAILS_PAGE_BUTTON_TEXT,
      buttonColor: APP_COLOR_SECONDARY_COLOR,
      buttonTextColor: SECONDARY_BUTTON_TEXT_COLOR,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const CinemaSelectionPage();
            },
          ),
        );
      },
    );
  }
}

class DetailsPageTopView extends StatelessWidget {
  final List<String> genreList = ["Action", "Adventure", "Thriller"];

  DetailsPageTopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.topCenter,
          child: MovieBackgroundView(),
        ),
        const Positioned(
          left: MARGIN_MEDIUM_15X,
          top: MARGIN_XLARGE_200X + MARGIN_MEDIUM_20X,
          child: MoviePosterView(),
        ),
        Positioned(
          right: MARGIN_MEDIUM_20X,
          top: MARGIN_XLARGE_250X,
          child: MovieDescriptionView(genreList: genreList),
        ),
      ],
    );
  }
}

class MovieDescriptionView extends StatelessWidget {
  const MovieDescriptionView({
    Key? key,
    required this.genreList,
  }) : super(key: key);

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_LARGE_100X + MARGIN_MEDIUM_50X,
      width: MARGIN_XLARGE_200X + MARGIN_SMALL_10X,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: MARGIN_SMALL_10X),
          Row(
            children: const [
              MovieNameView(MARGIN_MEDIUM_15X, "John Wick 4"),
              SizedBox(
                width: MARGIN_MEDIUM_20X,
              ),
              IMDBView(),
              IMDBRatingView(TEXT_MEDIUM, "9.1")
            ],
          ),
          const SizedBox(height: MARGIN_MEDIUM_17X),
          const MovieTypesView(
              TEXT_MEDIUM, COMING_SOON_MOVIS_DEtAILS_SCREEN_MOVIES_TYPES_TEXT),
          SizedBox(
            height: MARGIN_LARGE_80X,
            width: MARGIN_XLARGE_200X,
            child: Wrap(
              runSpacing: -MARGIN_SMALL_7X,
              spacing: MARGIN_SMALL_5X,
              children: genreList
                  .map((text) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: MARGIN_SMALL_4X),
                        child: Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(MARGIN_SMALL_10X),
                          ),
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: MARGIN_SMALL_4X,
                              vertical: -MARGIN_SMALL_1X),
                          backgroundColor: APP_COLOR_SECONDARY_COLOR,
                          label: Text(
                            text,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: MARGIN_SMALL_10X + MARGIN_SMALL_2X),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class DetailsPageBottomView extends StatelessWidget {
  final bool isVisible;

  const DetailsPageBottomView({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_XLARGE_675X,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_15X + MARGIN_SMALL_2X),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CensorRatingReleaseDateAndDurationView(),
            const SizedBox(height: MARGIN_MEDIUM_20X),
            const TitleText(NOW_SHOWING_MOVIE_DETAILS_SCREEN_TITLE_TEXT),
            const SizedBox(height: MARGIN_SMALL_10X),
            const StoryLineTextView(),
            Visibility(
              visible: isVisible,
              child: Column(
                children: const [
                  SizedBox(height: MARGIN_MEDIUM_20X),
                  NotifyBoxView(),
                ],
              ),
            ),
            const SizedBox(height: MARGIN_SMALL_10X),
            const TitleText(NOW_SHOWING_MOVIS_DETAILS_SCREEN_CAST_TEXT),
            const SizedBox(height: MARGIN_MEDIUM_20X),
            const SizedBox(
              height: MARGIN_XLARGE_200X - MARGIN_MEDIUM_20X,
              child: MovieCastListView(),
            )
          ],
        ),
      ),
    );
  }
}

class MovieBackgroundView extends StatelessWidget {
  const MovieBackgroundView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_XLARGE_250X,
      width: double.maxFinite,
      child: Stack(
        children: const [
          NetworkVideoPlayerMovie(),
          Positioned(
            left: MARGIN_SMALL_5X,
            top: MARGIN_SMALL_10X,
            child: BackButtonView(),
          ),
          Positioned(
            right: MARGIN_MEDIUM_15X,
            top: MARGIN_SMALL_10X,
            child: ShareButtonView(),
          ),
        ],
      ),
    );
  }
}

class MoviePosterView extends StatelessWidget {
  const MoviePosterView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_LARGE_175X,
      width: MARGIN_LARGE_140X,
      child: Image.network(
        "https://pbs.twimg.com/media/FnfZD_nWAAI9fGF?format=jpg&name=4096x4096",
        fit: BoxFit.cover,
      ),
    );
  }
}

class BackGroundImageView extends StatelessWidget {
  const BackGroundImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://static1.colliderimages.com/wordpress/wp-content/uploads/2021/09/john-wick-4.jpg",
      fit: BoxFit.cover,
    );
  }
}

class MovieCastListView extends StatelessWidget {
  const MovieCastListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_SMALL_1X),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: MARGIN_SMALL_10X),
            child: SizedBox(
              width: MARGIN_LARGE_110X,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CastImageView(),
                  SizedBox(height: MARGIN_SMALL_10X),
                  CastNameView()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CastImageView extends StatelessWidget {
  const CastImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_LARGE_100X,
      clipBehavior: Clip.antiAlias,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      child: Image.network(
        "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Reuni%C3%A3o_com_o_ator_norte-americano_Keanu_Reeves_cropped_2_%2846806576944%29_%28cropped%29.jpg/1200px-Reuni%C3%A3o_com_o_ator_norte-americano_Keanu_Reeves_cropped_2_%2846806576944%29_%28cropped%29.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}

class CastNameView extends StatelessWidget {
  const CastNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Keanu Reeves",
      maxLines: 2,
      textAlign: TextAlign.center,
      style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: TEXT_MEDIUM,
          fontWeight: FontWeight.w700),
    );
  }
}

class NotifyBoxView extends StatelessWidget {
  const NotifyBoxView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DEFAULT_HEIGHT,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_SMALL_10X),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      NOTIFY_BOX_GRADIENT_COLOR_1,
                      NOTIFY_BOX_GRADIENT_COLOR_2,
                      NOTIFY_BOX_GRADIENT_COLOR_3
                    ]),
                borderRadius: BorderRadius.circular(MARGIN_SMALL_10X),
              ),
            ),
          ),
          Positioned.fill(
            child: Row(
              children: const [
                NotifyBoxTextLayers(),
                GirlCheckingPhoneImageView()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotifyBoxTextLayers extends StatelessWidget {
  const NotifyBoxTextLayers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_SMALL_10X),
      child: SizedBox(
        height: MARGIN_MEDIUM_40X + MARGIN_LARGE_100X,
        width: MARGIN_XLARGE_250X - MARGIN_SMALL_10X - MARGIN_SMALL_2X,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NotifyBoxReleasingTextView(),
            const SizedBox(height: MARGIN_SMALL_10X),
            const NotifyBoxDetailsTextView(),
            const SizedBox(height: MARGIN_MEDIUM_20X),
            GestureDetector(
              onTap: () {
                print("Noti Bell Tapped");
              },
              child: const NotificationButtonView(),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationButtonView extends StatelessWidget {
  const NotificationButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_MEDIUM_30X,
      width: MARGIN_XLARGE_200X - MARGIN_MEDIUM_40X,
      decoration: BoxDecoration(
        color: APP_COLOR_SECONDARY_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MARGIN_MEDIUM_15X,
              width: MARGIN_MEDIUM_15X,
              child: Image.asset(NOTI_BELL_IMAGE),
            ),
            const SizedBox(width: MARGIN_SMALL_10X),
            Text(
              COMING_SOON_MOVIS_DETAILS_NOTIFY_BUTTON_TEXT,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: TEXT_MEDIUM,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

class NotifyBoxDetailsTextView extends StatelessWidget {
  const NotifyBoxDetailsTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      COMING_SOON_MOVIS_DETAILS_SCREEN_NOTIFY_TEXT,
      style: GoogleFonts.inter(
          color: WHITE_COLOR,
          fontWeight: FontWeight.w600,
          fontSize: TEXT_MEDIUM),
    );
  }
}

class NotifyBoxReleasingTextView extends StatelessWidget {
  const NotifyBoxReleasingTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      COMING_SOON_MOVIS_DETAILS_SCREEN_RELEASING_TIME_TEXT,
      style: GoogleFonts.inter(
          color: WHITE_COLOR,
          fontWeight: FontWeight.w700,
          fontSize: TEXT_LARGE_16X),
    );
  }
}

class StoryLineTextView extends StatelessWidget {
  const StoryLineTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(COMING_SOON_MOVIS_DEtAILS_SCREEN_STORYLINE_TEXT,
        style: GoogleFonts.inter(
            fontSize: TEXT_MEDIUM,
            fontWeight: FontWeight.w500,
            color: Colors.white));
  }
}

class CensorRatingReleaseDateAndDurationView extends StatelessWidget {
  const CensorRatingReleaseDateAndDurationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        CensorDateDurationBox(
            titleText: NOW_SHOWING_MOVIS_DEtAILS_SCREEN_RATING_TEXT,
            subTitleText: "U/A",
            boxWidth: MARGIN_LARGE_100X),
        CensorDateDurationBox(
            titleText: NOW_SHOWING_MOVIS_DEtAILS_SCREEN_RELEASE_DATE_TEXT,
            subTitleText: "May 8th 2023",
            boxWidth: MARGIN_LARGE_115X),
        CensorDateDurationBox(
            titleText: NOW_SHOWING_MOVIS_DEtAILS_SCREEN_DURATION_TEXT,
            subTitleText: "3hr 10mins",
            boxWidth: MARGIN_LARGE_86X),
      ],
    );
  }
}

class GirlCheckingPhoneImageView extends StatelessWidget {
  const GirlCheckingPhoneImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DEFAULT_HEIGHT,
      width: MARGIN_LARGE_100X,
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_SMALL_8X),
        child: Image.asset(
          GIRL_CHECKING_PHONE_IMAGE,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
