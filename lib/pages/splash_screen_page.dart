import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/phone_number_verification_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/strings.dart';
import 'package:the_movie_booking/widgets/app_logo_view.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHomeScreen();
  }

  _navigateToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PhoneNumberVerificationPage(),
      ),
    );
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
              color: Colors.grey, fontSize: TEXT_LARGE_18X, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
