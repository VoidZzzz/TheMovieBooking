import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/cinema_details_page.dart';
import 'package:the_movie_booking/pages/seat_plan_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/strings.dart';
import 'package:the_movie_booking/search_page_widgets/search_filter_options_view.dart';
import 'package:the_movie_booking/search_page_widgets/search_pages_app_bar_title_view.dart';
import 'package:the_movie_booking/widgets/cinema_listview.dart';

class CinemaSearchPage extends StatefulWidget {
  const CinemaSearchPage({Key? key}) : super(key: key);

  @override
  State<CinemaSearchPage> createState() => _CinemaSearchPageState();
}

class _CinemaSearchPageState extends State<CinemaSearchPage> {
  RangeValues _rangeValueMMK = const RangeValues(3500, 20500);
  RangeValues _rangeValueTime = const RangeValues(8, 24);
  final double min1 = 3500;
  final double max1 = 29500;
  final double min2 = 8;
  final double max2 = 12;
  final List<String> cinemaList = [
    "JCGV:Junction",
    "Thamada Cinema",
    "ShaeSung Cinema"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APP_COLOR_PRIMARY_COLOR,
        elevation: MARGIN_SMALLEST,
        automaticallyImplyLeading: false,
        title: const SearchPagesAppBarTitleView(text: CINEMA_SEARCH_PAGE_SEARCH_FIELD_TEXT,),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_15X),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FilterOptionsView(),
                  const SizedBox(height: MARGIN_MEDIUM_15X),
                  const PriceRangeTitleTextView(),
                  const SizedBox(height: MARGIN_MEDIUM_15X),
                  RangeSliderTitle(
                      text1: "${min1.round().toString()} Ks",
                      text2: "${max1.round().toString()} Ks"),
                  SliderTheme(
                    data: const SliderThemeData(
                      activeTickMarkColor: Colors.transparent,
                      inactiveTickMarkColor: Colors.transparent,
                      activeTrackColor: APP_COLOR_SECONDARY_COLOR,
                      inactiveTrackColor: GREY_COLOR,
                      thumbColor: APP_COLOR_SECONDARY_COLOR,
                      trackHeight: MARGIN_SMALL_1X,
                    ),
                    child: RangeSlider(
                        values: _rangeValueMMK,
                        divisions: 10,
                        min: 3500,
                        max: 29500,
                        labels: RangeLabels(
                            "${_rangeValueMMK.start.round().toString()} Ks",
                            "${_rangeValueMMK.end.round().toString()} Ks"),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _rangeValueMMK = values;
                          });
                        }),
                  ),
                  const SizedBox(
                    height: MARGIN_MEDIUM_25X,
                  ),
                  RangeSliderTitle(
                      text1: "${min2.round().toString()}am",
                      text2: "${max2.round().toString()}pm"),
                  SliderTheme(
                    data: const SliderThemeData(
                      activeTickMarkColor: Colors.transparent,
                      inactiveTickMarkColor: Colors.transparent,
                      activeTrackColor: APP_COLOR_SECONDARY_COLOR,
                      inactiveTrackColor: GREY_COLOR,
                      thumbColor: APP_COLOR_SECONDARY_COLOR,
                      trackHeight: 1,
                    ),
                    child: RangeSlider(
                      divisions: 16,
                      labels: RangeLabels(
                          _rangeValueTime.start.round() > 12
                              ? '${_rangeValueTime.start.round() - 12} PM'
                              : '${_rangeValueTime.start.round()} AM',
                          _rangeValueTime.end.round() > 12
                              ? '${_rangeValueTime.end.round() - 12} PM'
                              : '${_rangeValueTime.end.round()} AM'),
                      values: _rangeValueTime,
                      min: 8,
                      max: 24,
                      onChanged: (valueTwo) {
                        setState(
                          () {
                            _rangeValueTime = valueTwo;
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: MARGIN_MEDIUM_30X),
                ],
              ),
            ),
            CinemaListView(
              cinemaList: cinemaList,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SeatPlanPage(),
                ),
              ),
              onTapDetails: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CinemaDetailsPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterOptionsView extends StatelessWidget {
  const FilterOptionsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SearchFilterOptionsView(text: CINEMA_SEARCH_PAGE_FACILITY_TEXT),
        SizedBox(width: MARGIN_MEDIUM_15X),
        SearchFilterOptionsView(text: CINEMA_SEARCH_PAGE_FORMAT_TEXT)
      ],
    );
  }
}

class PriceRangeTitleTextView extends StatelessWidget {
  const PriceRangeTitleTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      CINEMA_SEARCH_PAGE_PRICE_RANGE_TEXT,
      style: GoogleFonts.inter(
          fontWeight: FontWeight.w600, color: WHITE_COLOR),
    );
  }
}

class RangeSliderTitle extends StatelessWidget {
  const RangeSliderTitle({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style:
              GoogleFonts.inter(fontWeight: FontWeight.w500, color: GREY_COLOR),
        ),
        Text(
          text2,
          style:
              GoogleFonts.inter(fontWeight: FontWeight.w500, color: GREY_COLOR),
        ),
      ],
    );
  }
}
