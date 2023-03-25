import 'package:flutter/material.dart';
import 'package:the_movie_booking/pages/splash_screen_page.dart';
import 'package:the_movie_booking/persistence/hive_constants.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'data/data_vos/cities_vo.dart';
import 'data/data_vos/user_info_vo.dart';
import 'data/data_vos/user_vo.dart';
import 'network/response/sign_in_with_phone_response.dart';


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
      home: const SplashScreenPage()
    );
  }
}

