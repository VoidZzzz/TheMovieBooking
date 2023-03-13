import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/movie_details_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/strings.dart';
import 'package:the_movie_booking/widgets/app_bar_image_icon_view.dart';
import 'package:the_movie_booking/widgets/coming_soon_movie_poster_view.dart';
import 'package:the_movie_booking/widgets/now_showing_movie_poster_view.dart';
import '../resources/dimens.dart';
import '../search_page_widgets/search_filter_options_view.dart';
import '../search_page_widgets/search_pages_app_bar_title_view.dart';
import '../widgets/app_bar_back_arrow.dart';

class MovieSearchPage extends StatefulWidget {
  final int appBarIndex;

  const MovieSearchPage({super.key, required this.appBarIndex});

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  List<String> nowShowingSearchList = [
    "https://amc-theatres-res.cloudinary.com/v1579118595/amc-cdn/production/2/movies/13700/13679/Poster/p_800x1200_AMC_Avatar_110219.jpg",
    "https://cdn.shopify.com/s/files/1/0549/5835/8762/products/C_391.jpg?v=1642175845"
  ];

  List<String> comingSoonSearchList = [
    "https://pbs.twimg.com/media/FnfZD_nWAAI9fGF?format=jpg&name=4096x4096",
    "https://pbs.twimg.com/media/FaggTeiUIAAYpBZ.jpg:large",
    "https://pbs.twimg.com/media/Ff3zJ8uacAEuYag.jpg"
  ];
  bool isShow = false;
  bool isShowSuggestion = false;

  @override
  void initState() {
    super.initState();
    if (widget.appBarIndex == 0) {
      setState(
        () {
          isShow = false;
        },
      );
    } else {
      setState(
        () {
          isShow = true;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: MARGIN_SMALLEST,
        backgroundColor: APP_COLOR_PRIMARY_COLOR,
        title: SearchPagesAppBarTitleView(
          text: MOVIE_SEARCH_PAGE_SEARCH_FIELD_TEXT,
          onSubmitted: () {
            setState(() {
              isShowSuggestion = true;
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_15X),
              child: Row(
                children: [
                  const SearchFilterOptionsView(
                    text: MOVIE_SEARCH_PAGE_GENRE_TEXT,
                  ),
                  const SizedBox(width: MARGIN_MEDIUM_15X),
                  const SearchFilterOptionsView(
                    text: MOVIE_SEARCH_PAGE_FORMAT_TEXT,
                  ),
                  const SizedBox(width: MARGIN_MEDIUM_15X),
                  Visibility(
                    visible: isShow,
                    child: const SearchFilterOptionsView(
                      text: MOVIE_SEARCH_PAGE_MONTH_TEXT,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: MARGIN_MEDIUM_20X,
            ),
            isShowSuggestion
                ? MovieSuggestionView(
                    widget: widget,
                    nowShowingSearchList: nowShowingSearchList,
                    comingSoonSearchList: comingSoonSearchList,
                    widgetTwo: widget)
                : SizedBox(
                    height: 400,
                    child: Center(
                      child: Text(
                        "Empty",
                        style: GoogleFonts.inter(
                            fontSize: TEXT_LARGE_20X,
                            color: WHITE_COLOR,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class MovieSuggestionView extends StatelessWidget {
  const MovieSuggestionView({
    Key? key,
    required this.widget,
    required this.nowShowingSearchList,
    required this.comingSoonSearchList,
    required this.widgetTwo,
  }) : super(key: key);

  final MovieSearchPage widget;
  final List<String> nowShowingSearchList;
  final List<String> comingSoonSearchList;
  final MovieSearchPage widgetTwo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_8X),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: (widget.appBarIndex == 0)
            ? nowShowingSearchList.length
            : comingSoonSearchList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: MARGIN_XLARGE_350X, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return (widget.appBarIndex == 0)
              ? NowShowingMoviePosterView(
                  nowShowingMoviesList: nowShowingSearchList,
                  index: index,
                  onTapNowShowingMovie: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const MovieDetailsPage(isVisible: false),
                    ),
                  ),
                )
              : ComingSoonMoviePosterView(
                  comingSoonMoviesList: comingSoonSearchList,
                  onTapComingSoonMovie: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const MovieDetailsPage(isVisible: true),
                        ),
                      ),
                  index: index);
        },
      ),
    );
  }
}
