import 'package:flutter/material.dart';
import 'package:the_movie_booking/pages/cinema_details_page.dart';
import 'package:the_movie_booking/pages/cinema_page.dart';
import 'package:the_movie_booking/pages/cinema_selection_page.dart';
import 'package:the_movie_booking/pages/test.dart';
import 'package:the_movie_booking/pages/unused_home_page.dart';
import 'package:the_movie_booking/pages/location_page.dart';
import 'package:the_movie_booking/pages/bottom_navigation_bar_home_page.dart';
import 'package:the_movie_booking/pages/movie_details_page.dart';
import 'package:the_movie_booking/pages/otp_verification_page.dart';
import 'package:the_movie_booking/pages/payment_page.dart';
import 'package:the_movie_booking/pages/phone_number_verification_page.dart';
import 'package:the_movie_booking/pages/player.dart';
import 'package:the_movie_booking/pages/profile_page.dart';
import 'package:the_movie_booking/pages/seat_plan_page.dart';
import 'package:the_movie_booking/pages/snack_shop_page.dart';
import 'package:the_movie_booking/pages/splash_screen_page.dart';
import 'package:the_movie_booking/pages/home_page.dart';
import 'package:the_movie_booking/pages/ticket_confirmation_page.dart';
import 'package:the_movie_booking/pages/ticket_details_page.dart';
import 'package:the_movie_booking/pages/tickets_page.dart';
import 'package:the_movie_booking/pages/check_out_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/search_pages/cinema_search_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: APP_COLOR_PRIMARY_COLOR),
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
    );
  }
}

