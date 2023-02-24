import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/seat_plan_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';
import '../resources/dimens.dart';

class CinemaListView extends StatelessWidget {
  final Function onTap;
  final Function onTapDetails;
  const CinemaListView({
    Key? key,
    required this.cinemaList,
    required this.onTap,
    required this.onTapDetails,
  }) : super(key: key);

  final List<String> cinemaList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cinemaList.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(
            cinemaList[index],
            style: const TextStyle(
                color: WHITE_COLOR, fontWeight: FontWeight.bold),
          ),
          subtitle: const ExpansionTileSubtitleView(),
          trailing: ExpansionTrailingView(onTapDetails: onTapDetails),
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: MARGIN_MEDIUM_20X,
                              mainAxisSpacing: MARGIN_MEDIUM_20X),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            onTap();
                          },
                          child: Container(
                            width: MARGIN_LARGE_100X,
                            height: MARGIN_LARGE_100X,
                            padding: const EdgeInsets.all(MARGIN_SMALL_5X),
                            decoration: BoxDecoration(
                              color: DARK_GREY_COLOR,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(MARGIN_SMALL_5X),
                              ),
                              border: Border.all(
                                color: Colors.grey,
                                width: MARGIN_SMALL_1X,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '9 AM',
                                  style: TextStyle(color: GREY_COLOR),
                                ),
                                Text(
                                  '3D',
                                  style: TextStyle(color: GREY_COLOR),
                                ),
                                Text(
                                  'Screen 1',
                                  style: TextStyle(color: GREY_COLOR),
                                ),
                                Text(
                                  '21 Available',
                                  style: TextStyle(color: GREY_COLOR),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_12X),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: MARGIN_SMALL_4X),
                          child: Icon(
                            Icons.info,
                            color: GREY_COLOR,
                            size: TEXT_LARGE_15X,
                          ),
                        ),
                        Text(
                          CINEMA_SELECTION_PAGE_LONG_PRESS_OPTION_TEXT,
                          style: TextStyle(
                              color: GREY_COLOR, fontSize: TEXT_SMALLEST),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: GREY_COLOR,
        );
      },
    );
  }
}

class ExpansionTrailingView extends StatelessWidget {
  const ExpansionTrailingView({
    Key? key,
    required this.onTapDetails,
  }) : super(key: key);

  final Function onTapDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: MARGIN_MEDIUM_20X),
      child: GestureDetector(
        onTap: () {
          onTapDetails();
        },
        child: const Text(
          CINEMA_SELECTION_PAGE_SEE_DETAILS_TEXT,
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: APP_COLOR_SECONDARY_COLOR),
        ),
      ),
    );
  }
}

class ExpansionTileSubtitleView extends StatelessWidget {
  const ExpansionTileSubtitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MARGIN_SMALL_8X),
      child: Row(
        children: const [
          CinemaListFacilityIconView(
            imageURL: PARKING_IMAGE,
            text: CINEMA_SELECTION_PAGE_PARKING_FACILITY_TEXT,
          ),
          SizedBox(width: MARGIN_SMALL_9X),
          CinemaListFacilityIconView(
            imageURL: CART_ITEM_COUNTS_IMAGE,
            text: CINEMA_SELECTION_PAGE_ONLINE_FOOD_FACILITY_TEXT,
          ),
          SizedBox(width: MARGIN_SMALL_9X),
          CinemaListFacilityIconView(
            imageURL: WHEEL_CHAIR_IMAGE,
            text: CINEMA_SELECTION_PAGE_WHEEL_CHAIR_FACILITY_TEXT,
          ),
        ],
      ),
    );
  }
}

class CinemaListFacilityIconView extends StatelessWidget {
  final String imageURL;
  final String text;
  const CinemaListFacilityIconView(
      {super.key, required this.imageURL, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: MARGIN_MEDIUM_12X,
          width: MARGIN_MEDIUM_12X,
          child: Image.asset(
            imageURL,
            color: GREY_COLOR,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: MARGIN_SMALL_5X),
          child: Text(
            text,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500, fontSize: TEXT_SMALL_12X, color: GREY_COLOR),
          ),
        ),
      ],
    );
  }
}
