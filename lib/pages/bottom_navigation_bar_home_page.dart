import 'package:flutter/material.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_booking_model.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_booking_model_impl.dart';
import 'package:the_movie_booking/pages/cinema_page.dart';
import 'package:the_movie_booking/pages/unused_home_page.dart';
import 'package:the_movie_booking/pages/profile_page.dart';
import 'package:the_movie_booking/pages/home_page.dart';
import 'package:the_movie_booking/pages/tickets_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';

import '../authentication/data/data_vos/cinema_details_vo.dart';

class BottomNaviBarHomePage extends StatefulWidget {
  const BottomNaviBarHomePage({Key? key}) : super(key: key);

  @override
  State<BottomNaviBarHomePage> createState() => _BottomNaviBarHomePageState();
}

class _BottomNaviBarHomePageState extends State<BottomNaviBarHomePage> {
  int currentIndex = 0;

  final List<Widget> _body = const [
    HomePage(
      cityName: 'Yangon',
    ),
    CinemaPage(),
    TicketPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: APP_COLOR_PRIMARY_COLOR,
        selectedItemColor: APP_COLOR_SECONDARY_COLOR,
        unselectedItemColor: HOME_SCREEN_NAVIBAR_UNSELECTED_COLOR,
        items: [
          BottomNavigationBarItem(
            icon: NavigationBarItem(
                imageURL: NAVIGATION_PLAY_ICON_IMAGE,
                currentIndex: currentIndex,
                fixedIndex: 0),
            label: NAVIGATION_BAR_MOVIE_TEXT,
          ),
          BottomNavigationBarItem(
            icon: NavigationBarItem(
                imageURL: NAVIGATION_CINEMA_ICON_IMAGE,
                currentIndex: currentIndex,
                fixedIndex: 1),
            label: NAVIGATION_BAR_CINEMA_TEXT,
          ),
          BottomNavigationBarItem(
            icon: NavigationBarItem(
                imageURL: NAVIGATION_TICKET_ICON_IMAGE,
                currentIndex: currentIndex,
                fixedIndex: 2),
            label: NAVIGATION_BAR_TICKETS_TEXT,
          ),
          BottomNavigationBarItem(
            icon: NavigationBarItem(
                imageURL: NAVIGATION_PROFILE_ICON_IMAGE,
                currentIndex: currentIndex,
                fixedIndex: 3),
            label: NAVIGATION_BAR_PROFILE_TEXT,
          ),
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  final int fixedIndex;
  final String imageURL;
  final int currentIndex;

  const NavigationBarItem(
      {super.key,
      required this.imageURL,
      required this.currentIndex,
      required this.fixedIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_MEDIUM_25X,
      width: MARGIN_MEDIUM_25X,
      child: Image.asset(imageURL,
          fit: BoxFit.fitWidth,
          color: currentIndex == fixedIndex
              ? APP_COLOR_SECONDARY_COLOR
              : LIGHT_GREY_COLOR),
    );
  }
}
