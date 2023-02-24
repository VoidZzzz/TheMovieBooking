import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/images.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class LocationScreenLocationBox extends StatelessWidget {
  const LocationScreenLocationBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_MEDIUM_50X,
      width: MARGIN_MEDIUM_50X,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
        color: APP_COLOR_SECONDARY_COLOR,
      ),
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_MEDIUM_15X),
        child: Image.asset(
          LOCATION_IMAGE,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
