import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/cinema_page.dart';
import 'package:the_movie_booking/pages/movie_details_page.dart';
import 'package:the_movie_booking/pages/profile_page.dart';
import 'package:the_movie_booking/pages/snack_shop_page.dart';
import 'package:the_movie_booking/pages/tickets_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';
import '../data/data_vos/banner_vo.dart';
import '../data/data_vos/movie_vo.dart';
import '../data/models/the_movie_booking_model.dart';
import '../data/models/the_movie_booking_model_impl.dart';
import '../network/api_constants.dart';
import '../search_pages/movie_search_page.dart';
import '../widgets/IMDBRatingView.dart';
import '../widgets/MovieTypesView.dart';
import '../widgets/app_bar_city_name_view.dart';
import '../widgets/app_bar_image_icon_view.dart';
import '../widgets/coming_soon_movie_poster_view.dart';
import '../widgets/imdb_view.dart';
import '../widgets/movie_name_view.dart';
import '../widgets/now_showing_movie_poster_view.dart';

class HomePage extends StatefulWidget {
  final String cityName;

  const HomePage({super.key, required this.cityName});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int currentIndex = 0;
  int activeDots = 0;

  List<BannerVO>? bannerList;
  List<MovieVO>? comingSoonMoviesList;
  List<MovieVO>? nowShowingMoviesList;

  TheMovieBookingModel theMovieBookingModel = TheMovieBookingModelImpl();

  @override
  void initState() {
    theMovieBookingModel.getBanners().then((banners) {
      bannerList = banners.data;
    }).catchError((error) {
      debugPrint("================================> $error");
    });

    theMovieBookingModel.getNowShowingMovies(STATUS_CURRENT).then((movieList) {
      setState(() {
        nowShowingMoviesList = movieList.data;
      });
    }).catchError((error) {
      debugPrint("================================> $error");
    });

    theMovieBookingModel
        .getComingSoonMovies(STATUS_COMING_SOON)
        .then((movieList) {
      setState(() {
        comingSoonMoviesList = movieList.data;
      });
    }).catchError((error) {
      debugPrint("================================> $error");
    });

    controller = TabController(length: 2, vsync: this);
    controller.addListener(
      () {
        setState(
          () {
            currentIndex = controller.index;
          },
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, isScroll) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: APP_COLOR_PRIMARY_COLOR,
                collapsedHeight: MARGIN_XLARGE_340X,
                expandedHeight: MARGIN_XLARGE_340X,
                flexibleSpace: Column(
                  children: [
                    AppBarView(
                      cityName: widget.cityName,
                      tabBarIndex: currentIndex,
                    ),
                    CarouselSlider.builder(
                      itemCount: (bannerList == null) ? 1 : bannerList?.length,
                      itemBuilder: (context, index, i) {
                        final urlImage = bannerList?[index];
                        return buildImage(urlImage, index);
                      },
                      options: CarouselOptions(
                          onPageChanged: (index, reason) =>
                              setState(() => activeDots = index),
                          enlargeCenterPage: true,
                          height: HOME_SCREEN_CAROUSEL_SLIDER_HEIGHT),
                    ),
                    const SizedBox(height: MARGIN_MEDIUM_18X),
                    HomeScreenBannerDotsView(
                        bannerList: bannerList ?? [], activeDots: activeDots),
                    const SizedBox(height: MARGIN_MEDIUM_20X),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_20X),
                      child: HomeScreenTabView(controller: controller),
                    ),
                  ],
                ),
              )
            ];
          },
          body: BodyTabBarView(
              controller: controller,
              nowShowingMoviesList: nowShowingMoviesList,
              comingSoonMoviesList: comingSoonMoviesList),
        ),
      ),
    );
  }

  Widget buildImage(BannerVO? urlImage, int index) => (urlImage != null)
      ? Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(BORDER_CIRCULAR_RADIUS),
          ),
          height: MARGIN_LARGE_170X,
          width: MARGIN_XLARGE_370X,
          child: HomeScreenBannerSectionView(
            urlImage: urlImage,
          ),
        )
      : const Center(
          child: CircularProgressIndicator(
            color: APP_COLOR_SECONDARY_COLOR,
          ),
        );
}

class BodyTabBarView extends StatelessWidget {
  const BodyTabBarView({
    Key? key,
    required this.controller,
    required this.nowShowingMoviesList,
    required this.comingSoonMoviesList,
  }) : super(key: key);

  final TabController controller;
  final List<MovieVO>? nowShowingMoviesList;
  final List<MovieVO>? comingSoonMoviesList;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        NowShowingTabBarView(
          nowShowingMoviesList: nowShowingMoviesList,
          onTapNowShowingMovie: (movieId) => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailsPage(
                isVisible: false,
                movieId: movieId ?? 1,
              ),
            ),
          ),
        ),
        ComingSoonTabBarView(
          comingSoonMoviesList,
          (movieId) => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailsPage(
                isVisible: true,
                movieId: movieId ?? 1,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class AppBarView extends StatelessWidget {
  final String cityName;
  final int tabBarIndex;

  const AppBarView(
      {super.key, required this.cityName, required this.tabBarIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: MARGIN_MEDIUM_20X),
        const AppBarImageIconView(LOCATION_IMAGE),
        const SizedBox(width: MARGIN_SMALL_10X),
        AppBarCityNameView(cityName),
        const Spacer(),
        GestureDetector(
          // onTap: () {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => MovieSearchPage(
          //         appBarIndex: tabBarIndex,
          //       ),
          //     ),
          //   );
          // },
          child: const AppBarImageIconView(SEARCH_ICON_IMAGE),
        ),
        const SizedBox(width: MARGIN_MEDIUM_30X),
        const AppBarImageIconView(NOTI_ICON_IMAGE),
        const SizedBox(width: MARGIN_MEDIUM_15X),
        const AppBarImageIconView(
          QR_SCAN_ICON_IMAGE,
          imageScale: 3,
          containerHeight: MARGIN_MEDIUM_50X,
          containerWidth: MARGIN_MEDIUM_50X,
        )
      ],
    );
  }
}

class HomeScreenTabView extends StatelessWidget {
  const HomeScreenTabView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MARGIN_LARGE_55X,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(MARGIN_SMALL_6X),
          ),
          child: Padding(
            padding: const EdgeInsets.all(MARGIN_SMALL_8X),
            child: TabBar(
              controller: controller,
              labelStyle: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700, fontSize: TEXT_LARGE_16X),
              labelColor: HOME_SCREEN_TAB_BAR_TEXT_COLOR,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(MARGIN_SMALL_6X),
                  color: APP_COLOR_SECONDARY_COLOR),
              tabs: const [
                Tab(
                  text: HOME_PAGE_NOW_SHOWING_TEXT,
                ),
                Tab(
                  text: HOME_PAGE_COMING_SOON_TEXT,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: MARGIN_MEDIUM_20X),
      ],
    );
  }
}

class ComingSoonTabBarView extends StatelessWidget {
  const ComingSoonTabBarView(
      this.comingSoonMoviesList, this.onTapComingSoonMovie,
      {super.key});

  final Function(int?) onTapComingSoonMovie;
  final List<MovieVO>? comingSoonMoviesList;

  @override
  Widget build(BuildContext context) {
    return (comingSoonMoviesList != null)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_8X),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: comingSoonMoviesList?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: MARGIN_XLARGE_350X, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>
                      onTapComingSoonMovie(comingSoonMoviesList?[index].id),
                  child: ComingSoonMoviePosterView(
                    comingSoonMoviesList: comingSoonMoviesList,
                    index: index,
                  ),
                );
              },
            ),
          )
        : const Center(
            child: CircularProgressIndicator(
              color: APP_COLOR_SECONDARY_COLOR,
            ),
          );
  }
}

class NowShowingTabBarView extends StatelessWidget {
  const NowShowingTabBarView(
      {Key? key,
      required this.nowShowingMoviesList,
      required this.onTapNowShowingMovie})
      : super(key: key);

  final List<MovieVO>? nowShowingMoviesList;
  final Function(int?) onTapNowShowingMovie;

  @override
  Widget build(BuildContext context) {
    return (nowShowingMoviesList != null)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: nowShowingMoviesList?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: MARGIN_XLARGE_350X, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () =>
                        onTapNowShowingMovie(nowShowingMoviesList?[index].id),
                    child: NowShowingMoviePosterView(
                      nowShowingMoviesList: nowShowingMoviesList,
                      index: index,
                    ),
                  );
                }),
          )
        : const Center(
            child: CircularProgressIndicator(
              color: APP_COLOR_SECONDARY_COLOR,
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
      "U/A",
      style: GoogleFonts.inter(
          fontSize: TEXT_SMALL_12X,
          fontWeight: FontWeight.w600,
          color: Colors.white),
    );
  }
}

class HomeScreenBannerDotsView extends StatelessWidget {
  const HomeScreenBannerDotsView({
    Key? key,
    required this.bannerList,
    required this.activeDots,
  }) : super(key: key);

  final List<BannerVO> bannerList;
  final int activeDots;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: (bannerList.isNotEmpty) ? bannerList.length : 1,
      position: activeDots.toDouble(),
      decorator: const DotsDecorator(
          color: HOME_SCREEN_BANNER_DOTS_INACTIVE_COLOR,
          activeColor: APP_COLOR_SECONDARY_COLOR),
    );
  }
}

class HomeScreenAppBarView extends StatelessWidget {
  final String selectedCity;
  final int appBarIndex;
  final Function onTapSearch;

  const HomeScreenAppBarView(
      {super.key,
      required this.selectedCity,
      required this.appBarIndex,
      required this.onTapSearch});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppBarImageIconView(LOCATION_IMAGE),
        const SizedBox(width: MARGIN_SMALL_8X),
        AppBarCityNameView(selectedCity),
        const Spacer(),
        GestureDetector(
          onTap: () => onTapSearch(),
          child: const AppBarImageIconView(SEARCH_ICON_IMAGE),
        ),
        const SizedBox(width: MARGIN_MEDIUM_30X),
        const AppBarImageIconView(NOTI_ICON_IMAGE),
        const SizedBox(width: MARGIN_MEDIUM_15X),
        const AppBarImageIconView(
          QR_SCAN_ICON_IMAGE,
          imageScale: 3,
          containerHeight: MARGIN_MEDIUM_50X,
          containerWidth: MARGIN_MEDIUM_50X,
        )
      ],
    );
  }
}

class HomeScreenBannerSectionView extends StatelessWidget {
  final BannerVO? urlImage;

  const HomeScreenBannerSectionView({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: HomeScreenDiscountBannerBackgroundImage(
            urlImage: urlImage?.url ?? "",
          ),
        ),
        const Positioned.fill(
          child: HomeScreenDiscountBannerGradientImage(),
        ),
        const Positioned(
          left: MARGIN_MEDIUM_18X,
          bottom: MARGIN_MEDIUM_15X,
          child: HomeScreenDiscountBannerBankCardImage(),
        ),
        const Positioned(
          left: MARGIN_MEDIUM_18X,
          top: MARGIN_MEDIUM_15X,
          child: HomeScreenDiscountBannerTextImage(),
        ),
      ],
    );
  }
}

class HomeScreenDiscountBannerTextImage extends StatelessWidget {
  const HomeScreenDiscountBannerTextImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HOME_SCREEN_DISCOUNT_BANNER_TEXT_IMAGE_HEIGHT,
      width: HOME_SCREEN_DISCOUNT_BANNER_TEXT_IMAGE_WIDTH,
      child: Image.asset(
        DISCOUNT_IMAGE_1,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class HomeScreenDiscountBannerBankCardImage extends StatelessWidget {
  const HomeScreenDiscountBannerBankCardImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HOME_SCREEN_DISCOUNT_BANNER_BANK_CARD_IMAGE_HEIGHT,
      width: HOME_SCREEN_DISCOUNT_BANNER_BANK_CARD_IMAGE_WIDTH,
      child: Image.asset(
        DISCOUNT_IMAGE_2,
        fit: BoxFit.cover,
      ),
    );
  }
}

class HomeScreenDiscountBannerGradientImage extends StatelessWidget {
  const HomeScreenDiscountBannerGradientImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      DISCOUNT_IMAGE_3,
      fit: BoxFit.cover,
    );
  }
}

class HomeScreenDiscountBannerBackgroundImage extends StatelessWidget {
  final String urlImage;

  const HomeScreenDiscountBannerBackgroundImage({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: urlImage,
      placeholder: (context, url) => const Center(
        child: SizedBox(
          height: MARGIN_MEDIUM_40X,
          width: MARGIN_MEDIUM_40X,
          child: CircularProgressIndicator(
            color: APP_COLOR_SECONDARY_COLOR,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
