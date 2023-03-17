import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/widgets/movie_name_view.dart';
import '../authentication/data/data_vos/movie_vo.dart';
import '../authentication/network/api_constants.dart';
import '../pages/home_page.dart';
import '../pages/unused_home_page.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import 'IMDBRatingView.dart';
import 'MovieTypesView.dart';
import 'imdb_view.dart';

class NowShowingMoviePosterView extends StatelessWidget {
  const NowShowingMoviePosterView({
    Key? key,
    required this.nowShowingMoviesList,
    required this.index,
  }) : super(key: key);

  final List<MovieVO>? nowShowingMoviesList;
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
                  child: CachedNetworkImage(imageUrl: "$IMAGE_BASE_URL${nowShowingMoviesList?[index].posterPath?? ""}",fit: BoxFit.cover,),
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
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_SMALL_10X),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MovieNameView(TEXT_SMALL_12X,
                                  nowShowingMoviesList?[index].originalTitle ?? ""),
                              const Spacer(),
                              const IMDBView(),
                              const IMDBRatingView(TEXT_MEDIUM, "7.9")
                            ],
                          ),
                          const SizedBox(
                              height: MARGIN_SMALL_10X + MARGIN_SMALL_2X),
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
                              MovieTypesView(TEXT_SMALL_12X,
                                  NOW_SHOWING_MOVIS_DEtAILS_SCREEN_MOVIES_TYPES_TEXT)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}