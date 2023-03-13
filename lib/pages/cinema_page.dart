import 'package:flutter/material.dart';
import 'package:the_movie_booking/pages/cinema_details_page.dart';
import 'package:the_movie_booking/pages/seat_plan_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/search_pages/cinema_search_page.dart';
import 'package:the_movie_booking/widgets/app_bar_back_arrow.dart';
import 'package:the_movie_booking/widgets/cinema_listview.dart';

import '../resources/dimens.dart';
import '../resources/images.dart';
import '../widgets/app_bar_image_icon_view.dart';

class CinemaPage extends StatefulWidget {
  const CinemaPage({Key? key}) : super(key: key);

  @override
  State<CinemaPage> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  List<String> cinemaList = [
    'JCGV : Junction City',
    'JCGV : City Mall',
    'Mingalar Cinema Gold Class',
    'Nawaday Cinema',
    'Thamada Cinema'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /// App Bar
        appBar: AppBar(
          elevation: MARGIN_SMALLEST,
          automaticallyImplyLeading: false,
          backgroundColor: APP_COLOR_PRIMARY_COLOR,
          title: Row(
            children: [
              const Spacer(),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CinemaSearchPage(),
                  ),
                ),
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
          ),
        ),

        /// Body
        body: CinemaListView(
          cinemaList: cinemaList,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const SeatPlanPage();
                },
              ),
            );
          },
          onTapDetails: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return CinemaDetailsPage();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
