import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/authentication/network/api_constants.dart';
import 'package:the_movie_booking/resources/images.dart';

import '../authentication/data/data_vos/movie_vo.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';

class ComingSoonMoviePosterView extends StatelessWidget {
  const ComingSoonMoviePosterView({
    Key? key,
    required this.comingSoonMoviesList,
    required this.index,
  }) : super(key: key);

  final List<MovieVO>? comingSoonMoviesList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_SMALL_8X),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM_15X),
        ),
        child: Stack(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl:
                        "$IMAGE_BASE_URL${comingSoonMoviesList?[index].posterPath ?? ""}",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Image.asset(
                    HOME_SCREEN_GRADIENT_IMAGE,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: MARGIN_LARGE_80X,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_SMALL_10X),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MovieNameView(
                                movieName: comingSoonMoviesList?[index]
                                        .originalTitle ??
                                    "",
                              ),
                              const Spacer(),
                              const IMDBView(),
                              const IMDBRatingView()
                            ],
                          ),
                          const SizedBox(
                              height: MARGIN_SMALL_2X + MARGIN_SMALL_10X),
                          Row(
                            children: const [
                              UnknownTextView(),
                              SizedBox(
                                width: MARGIN_SMALL_8X,
                              ),
                              CircleDotView(),
                              SizedBox(
                                width: MARGIN_SMALL_10X,
                              ),
                              MovieTypeView()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: MARGIN_SMALL_8X,
                    top: MARGIN_SMALL_7X,
                    child: Container(
                      height: MARGIN_MEDIUM_30X,
                      width: MARGIN_MEDIUM_25X + MARGIN_SMALL_8X,
                      decoration: BoxDecoration(
                        color: APP_COLOR_SECONDARY_COLOR,
                        borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
                      ),
                      child: Text(
                        "9th AUG",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w700,
                            color: SHALLOW_GREY_COLOR,
                            fontSize: TEXT_SMALLEST),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MovieTypeView extends StatelessWidget {
  const MovieTypeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        "2D",
        maxLines: 2,
        softWrap: true,
        textAlign: TextAlign.start,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: TEXT_SMALL_12X,
            color: Colors.white),
      ),
    );
  }
}

class CircleDotView extends StatelessWidget {
  const CircleDotView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_SMALL_8X,
      width: MARGIN_SMALL_8X,
      child: Image.asset(
        CIRCLE_IMAGE,
        fit: BoxFit.cover,
      ),
    );
  }
}

class UnknownTextView extends StatelessWidget {
  const UnknownTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "U",
      style: GoogleFonts.inter(
          fontSize: TEXT_SMALL_12X,
          fontWeight: FontWeight.w600,
          color: Colors.white),
    );
  }
}

class IMDBRatingView extends StatelessWidget {
  const IMDBRatingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "9.1",
      style: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          fontSize: TEXT_MEDIUM,
          color: Colors.white),
    );
  }
}

class IMDBView extends StatelessWidget {
  const IMDBView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_MEDIUM_20X,
      width: MARGIN_MEDIUM_30X + MARGIN_SMALL_2X,
      child: Image.asset(
        IMDB_IMAGE,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MovieNameView extends StatelessWidget {
  final String movieName;

  const MovieNameView({super.key, required this.movieName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MARGIN_LARGE_100X,
      child: Text(
        movieName,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.inter(
            fontSize: TEXT_SMALL_12X,
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
    );
  }
}
