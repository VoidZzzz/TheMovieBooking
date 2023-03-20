import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_api_model.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_booking_model.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_booking_model_impl.dart';
import 'package:the_movie_booking/authentication/persistence/daos/user_data_dao.dart';
import 'package:the_movie_booking/pages/bottom_navigation_bar_home_page.dart';
import 'package:the_movie_booking/pages/home_page.dart';
import 'package:the_movie_booking/pages/phone_number_verification_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/strings.dart';
import 'package:the_movie_booking/widgets/app_logo_view.dart';

import '../authentication/data/data_vos/color_vo.dart';
import '../authentication/data/models/the_movie_api_model_impl.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  TheMovieBookingModel theMovieBookingModel = TheMovieBookingModelImpl();
  List<dynamic>? colorList;
  String? colorHexCode;

  @override
  void initState() {
    /// get userToken from Database
    debugPrint(
        ' ===============================> USER TOKEN = ${theMovieBookingModel.getUserDataFromDatabase()?.token} ');

    /// getCities from Network
    theMovieBookingModel
        .getCities()
        .then((response) => {
              debugPrint(
                  "======================================> CITIES LENGTH = ${response.data?.length}")
            })
        .catchError((error) {
      debugPrint(error.toString());
    });

    /// getConfig from Network
    theMovieBookingModel.getConfigurations().then((config) {
      // debugPrint(
      //     "=========================================> CONFIG COLOR VO ${config.data?[1].value}");
      // setState(() {
      // colorList = config.data?[1].value;
      // });
      debugPrint("${config.data?[1].value.runtimeType == List<dynamic>}");
    }).catchError((error) {
      debugPrint("============================> ${error.toString()}");
    });

    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    if (theMovieBookingModel.getUserDataFromDatabase()?.token == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PhoneNumberVerificationPage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNaviBarHomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: APP_COLOR_PRIMARY_COLOR,
        child: const SplashScreenView(),
      ),
    );
  }
}

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        AppLogoView(),
        SizedBox(height: MARGIN_MEDIUM_15X),
        SplashScreenTitle()
      ],
    );
  }
}

class SplashScreenTitle extends StatelessWidget {
  const SplashScreenTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          SPLASH_SCREEN_PAGE_LEADING_TEXT,
          style: GoogleFonts.inter(
              color: APP_COLOR_SECONDARY_COLOR,
              fontSize: TEXT_LARGE_20X,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: MARGIN_SMALL_6X),
        Text(
          SPLASH_SCREEN_PAGE_TITLE_TEXT,
          style: GoogleFonts.inter(
              color: Colors.grey,
              fontSize: TEXT_LARGE_18X,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
