import 'package:flutter/material.dart';
import 'package:the_movie_booking/authentication/data/data_vos/user_info_vo.dart';
import 'package:the_movie_booking/authentication/data/data_vos/user_vo.dart';
import 'package:the_movie_booking/authentication/persistence/hive_constants.dart';
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
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'authentication/data/data_vos/cities_vo.dart';
import 'authentication/network/response/sign_in_with_phone_response.dart';


void main() async{
  await Hive.initFlutter();

  Hive.registerAdapter(SignInWithPhoneResponseAdapter());
  Hive.registerAdapter(UserVOAdapter());
  Hive.registerAdapter(CitiesVOAdapter());
  Hive.registerAdapter(UserInfoVOAdapter());

  await Hive.openBox<SignInWithPhoneResponse>(BOX_NAME_SIGN_WITH_PHONE_RESPONSE);
  await Hive.openBox<UserVO>(BOX_NAME_USER_VO);
  await Hive.openBox<CitiesVO>(BOX_NAME_CITIES_VO);
  await Hive.openBox<UserInfoVO>(BOX_NAME_USER_INFO_VO);

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
      home: SplashScreenPage()
    );
  }
}

