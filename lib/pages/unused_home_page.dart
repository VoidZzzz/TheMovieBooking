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
import '../search_pages/movie_search_page.dart';
import '../widgets/IMDBRatingView.dart';
import '../widgets/MovieTypesView.dart';
import '../widgets/app_bar_city_name_view.dart';
import '../widgets/app_bar_image_icon_view.dart';
import '../widgets/coming_soon_movie_poster_view.dart';
import '../widgets/imdb_view.dart';
import '../widgets/movie_name_view.dart';
import '../widgets/now_showing_movie_poster_view.dart';

class UnusedHomePage extends StatefulWidget {
  final String cityName;

  const UnusedHomePage({super.key, required this.cityName});

  @override
  State<UnusedHomePage> createState() => _UnusedHomePageState();
}

class _UnusedHomePageState extends State<UnusedHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int currentIndex = 0;
  int activeDots = 0;

  final List<String> urlImages = [
    DISCOUNT_KFC_IMAGE,
    DISCOUNT_LOTERRIA_IMAGE,
    DISCOUNT_POP_CORN_IMAGE,
    DISCOUNT_TEA_IMAGE,
  ];

  final List<String> nowShowingMoviesList = [
    "https://amc-theatres-res.cloudinary.com/v1579118595/amc-cdn/production/2/movies/13700/13679/Poster/p_800x1200_AMC_Avatar_110219.jpg",
    "https://cdn.shopify.com/s/files/1/0549/5835/8762/products/C_391.jpg?v=1642175845",
    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a58a7719-0dcf-4e0b-b7bb-d2b725dbbb8e/dffeqg5-ddc23aed-cdfe-4758-a5b6-aeaec1fa7854.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2E1OGE3NzE5LTBkY2YtNGUwYi1iN2JiLWQyYjcyNWRiYmI4ZVwvZGZmZXFnNS1kZGMyM2FlZC1jZGZlLTQ3NTgtYTViNi1hZWFlYzFmYTc4NTQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.jJmX5aGgCFso7OaKligbAFEDLaCN-zb4v9NDoLUBCIU",
    "https://images.fandango.com/ImageRenderer/820/0/redesign/static/img/default_poster.png/0/images/masterrepository/fandango/229092/AliceDarling_2000x3000.jpg",
    "https://m.media-amazon.com/images/M/MV5BZDc4MzVkNzYtZTRiZC00ODYwLWJjZmMtMDIyNjQ1M2M1OGM2XkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_FMjpg_UX1000_.jpg",
    "https://dx35vtwkllhj9.cloudfront.net/paramountpictures/babylon/images/regions/au/onesheet.jpg",
    "https://resizing.flixster.com/2TwYzc7hklVW2s4fN1ypuyYWMj0=/ems.cHJkLWVtcy1hc3NldHMvdHZzZXJpZXMvYjBiZTZiODMtODQ1OC00MDY3LTkzNTItZjZlMzQ5ZGM1MzEwLmpwZw==",
    "https://i.etsystatic.com/26602916/r/il/7ea2b2/4460747145/il_1080xN.4460747145_ofb3.jpg",
    "https://mlpnk72yciwc.i.optimole.com/cqhiHLc.IIZS~2ef73/w:auto/h:auto/q:75/https://bleedingcool.com/wp-content/uploads/2022/05/suzume_no_tojimari-351688185-large.jpg",
    "https://m.media-amazon.com/images/M/MV5BYmM2OTgzMjAtNTYxOS00ZjdlLWIzZmQtZDAwNmNiZGQ5NTQ4XkEyXkFqcGdeQXVyNjU0NTkwMDQ@._V1_FMjpg_UX1000_.jpg"
  ];

  final List<String> comingSoonMoviesList = [
    "https://pbs.twimg.com/media/FnfZD_nWAAI9fGF?format=jpg&name=4096x4096",
    "https://pbs.twimg.com/media/FaggTeiUIAAYpBZ.jpg:large",
    "https://pbs.twimg.com/media/Ff3zJ8uacAEuYag.jpg",
    "https://1.bp.blogspot.com/-FtxAKJ5Wkl4/XQraPQJy75I/AAAAAAAAidM/kWzl1uw62b4zVXvU74cJLFY7AMT46v2MgCLcBGAs/s1600/60619562_2340197119375103_555434379128602624_n.jpg"
  ];

  @override
  void initState() {
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
    return Scaffold(
      backgroundColor: APP_COLOR_PRIMARY_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: MARGIN_SMALLEST,
        backgroundColor: APP_COLOR_PRIMARY_COLOR,
        title: HomeScreenAppBarView(
          selectedCity: widget.cityName,
          appBarIndex: currentIndex,
          onTapSearch: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MovieSearchPage(
                  appBarIndex: currentIndex,
                ),
              ),
            );
          },
        ),
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  width: MARGIN_XLARGE_400X,
                  child: CarouselSlider.builder(
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, i) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                        onPageChanged: (index, reason) =>
                            setState(() => activeDots = index),
                        enlargeCenterPage: true,
                        height: HOME_SCREEN_CAROUSEL_SLIDER_HEIGHT),
                  ),
                ),
                const SizedBox(height: MARGIN_MEDIUM_18X),
                HomeScreenBannerDotsView(
                    urlImages: urlImages, activeDots: activeDots),
                const SizedBox(height: MARGIN_MEDIUM_30X),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MARGIN_MEDIUM_20X),
                  child: HomeScreenTabView(controller: controller),
                ),
                SizedBox(
                  height: HOMESCREEN_MOVIE_LIST_VIEW_HEIGHT,
                  width: FULL_SCREEN_WIDTH,
                  child: TabBarView(
                    controller: controller,
                    children: [
                      NowShowingTabBarView(
                        nowShowingMoviesList: nowShowingMoviesList,
                        onTapNowShowingMovie: () =>
                            Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const MovieDetailsPage(isVisible: false),
                          ),
                        ),
                      ),
                      ComingSoonTabBarView(
                        comingSoonMoviesList,
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MovieDetailsPage(
                              isVisible: true,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(BORDER_CIRCULAR_RADIUS)),
        height: MARGIN_LARGE_170X,
        width: MARGIN_XLARGE_370X,
        child: HomeScreenBannerSectionView(
          urlImage: urlImage,
        ),
      );
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

  final Function onTapComingSoonMovie;
  final List<String> comingSoonMoviesList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: comingSoonMoviesList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: MARGIN_XLARGE_350X, crossAxisCount: 2),
      itemBuilder: (context, index) {
        return ComingSoonMoviePosterView(
          onTapComingSoonMovie: onTapComingSoonMovie,
          comingSoonMoviesList: comingSoonMoviesList,
          index: index,
        );
      },
    );
  }
}

class NowShowingTabBarView extends StatelessWidget {
  const NowShowingTabBarView(
      {Key? key,
      required this.nowShowingMoviesList,
      required this.onTapNowShowingMovie})
      : super(key: key);

  final List<String> nowShowingMoviesList;
  final Function onTapNowShowingMovie;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: nowShowingMoviesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: MARGIN_XLARGE_350X, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return NowShowingMoviePosterView(
            onTapNowShowingMovie: onTapNowShowingMovie,
            nowShowingMoviesList: nowShowingMoviesList,
            index: index,
          );
        });
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
    required this.urlImages,
    required this.activeDots,
  }) : super(key: key);

  final List<String> urlImages;
  final int activeDots;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: urlImages.length,
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
  final String urlImage;

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
            urlImage: urlImage,
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
    return Image.asset(
      urlImage,
      fit: BoxFit.cover,
    );
  }
}
