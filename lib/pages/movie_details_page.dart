import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_api_model.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_api_model_impl.dart';
import 'package:the_movie_booking/authentication/network/api_constants.dart';
import 'package:the_movie_booking/pages/cinema_selection_page.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/video_players/asset_video_player.dart';
import 'package:the_movie_booking/video_players/network_video_player_movie.dart';
import 'package:the_movie_booking/video_players/youtube_video_player_movie_details.dart';
import 'package:the_movie_booking/widgets/app_bar_back_arrow.dart';
import 'package:the_movie_booking/widgets/censor_date_duration_box.dart';
import '../authentication/data/data_vos/cast_vo.dart';
import '../authentication/data/data_vos/movie_vo.dart';
import '../authentication/data/data_vos/video_vo.dart';
import '../authentication/data/models/the_movie_booking_model.dart';
import '../authentication/data/models/the_movie_booking_model_impl.dart';
import '../authentication/network/response/get_movie_details_response.dart';
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

class MovieDetailsPage extends StatefulWidget {
  final bool isVisible;
  final int movieId;

  const MovieDetailsPage(
      {super.key, required this.isVisible, required this.movieId});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  TheMovieBookingModel theMovieBookingModel = TheMovieBookingModelImpl();
  TheMovieApiModel theMovieApiModel = TheMovieApiModelImpl();
  MovieVO? movieDetail;
  List<VideoVO>? videoList;

  @override
  void initState() {

    /// Get MovieDetails from Network
    theMovieBookingModel.getMovieDetails(widget.movieId).then((movieDetails) {
      setState(() {
        movieDetail = movieDetails.data;
      });
    }).catchError((error) {
      debugPrint("Details Error ==========================> $error");
    });

    /// Get Movie Trailer Response from Network
    theMovieApiModel.getMovieTrailers(widget.movieId).then((response) {
      setState(() {
        videoList = response.results ?? [];
      });
      // debugPrint("===========================> TRAILER VIDEO KEY ${videoList?.last.key}");
    }).catchError((error){debugPrint("==========================> TRAILER VIDEO ERROR $error");});

    super.initState();
  }

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
                child: DetailsPageTopView(
                  movieDetails: movieDetail, movieId: widget.movieId,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: DetailsPageBottomView(
                  isVisible: widget.isVisible,
                  movieDetails: movieDetail,
                ),
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
  final MovieVO? movieDetails;
  final int? movieId;

  DetailsPageTopView({super.key, required this.movieDetails, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: MovieTrailerVideoView(movieId: movieId,),
        ),
        Positioned(
          left: MARGIN_MEDIUM_15X,
          top: MARGIN_XLARGE_200X,
          child: MoviePosterView(
            movieDetails: movieDetails,
          ),
        ),
        Positioned(
          right: MARGIN_MEDIUM_20X,
          top: MARGIN_XLARGE_240X - MARGIN_SMALL_10X,
          child: MovieDescriptionView(
            genreList: movieDetails?.genres ?? [],
            movieDetails: movieDetails,
          ),
        ),
      ],
    );
  }
}

class MovieDescriptionView extends StatelessWidget {
  const MovieDescriptionView(
      {Key? key, required this.genreList, required this.movieDetails})
      : super(key: key);

  final List<String> genreList;
  final MovieVO? movieDetails;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_LARGE_160X + MARGIN_SMALL_10X,
      width: MARGIN_XLARGE_200X + MARGIN_SMALL_10X,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: MARGIN_SMALL_10X),
          Row(
            children: [
              MovieNameView(
                  MARGIN_MEDIUM_15X, movieDetails?.originalTitle ?? ""),
              const SizedBox(
                width: MARGIN_MEDIUM_40X,
              ),
              const IMDBView(),
              IMDBRatingView(
                  TEXT_MEDIUM, movieDetails?.rating?.toStringAsFixed(1) ?? "")
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
  final MovieVO? movieDetails;

  const DetailsPageBottomView(
      {super.key, required this.isVisible, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_15X + MARGIN_SMALL_2X),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CensorRatingReleaseDateAndDurationView(
              movieDetails: movieDetails,
            ),
            const SizedBox(height: MARGIN_MEDIUM_20X),
            const TitleText(NOW_SHOWING_MOVIE_DETAILS_SCREEN_TITLE_TEXT),
            const SizedBox(height: MARGIN_SMALL_10X),
            StoryLineTextView(
              movieDetails: movieDetails,
            ),
            Visibility(
              visible: isVisible,
              child: Column(
                children: const [
                  SizedBox(height: MARGIN_MEDIUM_20X),
                  NotifyBoxView(),
                ],
              ),
            ),
            const SizedBox(height: MARGIN_MEDIUM_20X),
            const TitleText(NOW_SHOWING_MOVIS_DETAILS_SCREEN_CAST_TEXT),
            const SizedBox(height: MARGIN_SMALL_10X),
            SizedBox(
              height: MARGIN_XLARGE_200X - MARGIN_MEDIUM_20X,
              child: (movieDetails != null)
                  ? MovieCastListView(
                      movieDetails: movieDetails,
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: APP_COLOR_SECONDARY_COLOR,
                      ),
                    ),
            ),
            const SizedBox(height: MARGIN_MEDIUM_50X),
          ],
        ),
      ),
    );
  }
}

class MovieTrailerVideoView extends StatelessWidget {
  const MovieTrailerVideoView({
    Key? key,
    required this.movieId
  }) : super(key: key);

  final int? movieId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_XLARGE_250X,
      width: double.maxFinite,
      child: Stack(
        children: [
          YouTubeVideoPlayerMovieDetails(movieID: movieId,),
          const Positioned(
            left: MARGIN_SMALL_5X,
            top: MARGIN_SMALL_10X,
            child: BackButtonView(),
          ),
          const Positioned(
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
  final MovieVO? movieDetails;

  const MoviePosterView({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(MARGIN_SMALL_4X),),
      height: MARGIN_XLARGE_200X,
      width: MARGIN_LARGE_140X,
      child: (movieDetails != null)
          ? CachedNetworkImage(
              imageUrl: "$IMAGE_BASE_URL${movieDetails?.posterPath ?? ""}",
              fit: BoxFit.cover,
            )
          : const Center(
              child: CircularProgressIndicator(
                color: APP_COLOR_SECONDARY_COLOR,
              ),
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
  const MovieCastListView({Key? key, required this.movieDetails})
      : super(key: key);

  final MovieVO? movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_SMALL_1X),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: movieDetails?.casts?.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: MARGIN_SMALL_10X),
            child: SizedBox(
              width: MARGIN_LARGE_110X,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CastImageView(
                    castDetails: movieDetails?.casts?[index],
                  ),
                  const SizedBox(height: MARGIN_SMALL_10X),
                  CastNameView(
                    castDetails: movieDetails?.casts?[index],
                  )
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
  const CastImageView({Key? key, required this.castDetails}) : super(key: key);

  final CastVO? castDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_LARGE_100X,
      clipBehavior: Clip.antiAlias,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      child: Image.network(
        "$IMAGE_BASE_URL${castDetails?.profilePath ?? ""}",
        fit: BoxFit.cover,
      ),
    );
  }
}

class CastNameView extends StatelessWidget {
  const CastNameView({Key? key, required this.castDetails}) : super(key: key);

  final CastVO? castDetails;

  @override
  Widget build(BuildContext context) {
    return Text(
      castDetails?.name ?? "",
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
  const StoryLineTextView({Key? key, required this.movieDetails})
      : super(key: key);

  final MovieVO? movieDetails;

  @override
  Widget build(BuildContext context) {
    return Text(movieDetails?.overview ?? "",
        style: GoogleFonts.inter(
            fontSize: TEXT_MEDIUM,
            fontWeight: FontWeight.w500,
            color: Colors.white));
  }
}

class CensorRatingReleaseDateAndDurationView extends StatefulWidget {
  const CensorRatingReleaseDateAndDurationView(
      {Key? key, required this.movieDetails})
      : super(key: key);

  final MovieVO? movieDetails;

  @override
  State<CensorRatingReleaseDateAndDurationView> createState() =>
      _CensorRatingReleaseDateAndDurationViewState();
}

class _CensorRatingReleaseDateAndDurationViewState
    extends State<CensorRatingReleaseDateAndDurationView> {
  String getTimeString(int duration) {
    final int hour = duration ~/ 60;
    final int minutes = duration % 60;
    return '${hour.toString().padLeft(1, "0")}hr ${minutes.toString().padLeft(2, "0")}min';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CensorDateDurationBox(
            titleText: NOW_SHOWING_MOVIS_DEtAILS_SCREEN_RATING_TEXT,
            subTitleText: "U/A",
            boxWidth: MARGIN_LARGE_100X),
        CensorDateDurationBox(
            titleText: NOW_SHOWING_MOVIS_DEtAILS_SCREEN_RELEASE_DATE_TEXT,
            subTitleText: widget.movieDetails?.releaseDate ?? "",
            boxWidth: MARGIN_LARGE_115X),
        CensorDateDurationBox(
            titleText: NOW_SHOWING_MOVIS_DEtAILS_SCREEN_DURATION_TEXT,
            subTitleText: getTimeString(widget.movieDetails?.runtime ?? 1),
            boxWidth: MARGIN_LARGE_86X + 4),
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
