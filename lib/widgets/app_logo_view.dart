import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/images.dart';
import '../resources/dimens.dart';

class AppLogoView extends StatelessWidget {
  const AppLogoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: APP_LOGO_WIDTH,
      height: APP_LOGO_HEIGHT,
      child: Image.asset(LOGO_IMAGE),
    );
  }
}