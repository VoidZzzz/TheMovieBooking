import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';

import '../resources/colors.dart';

class LeftSemiCircleContainer extends StatelessWidget {
  const LeftSemiCircleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_MEDIUM_40X,
      width: MARGIN_MEDIUM_20X,
      decoration: const BoxDecoration(
        color: APP_COLOR_PRIMARY_COLOR,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(MARGIN_MEDIUM_20X),
          bottomRight: Radius.circular(MARGIN_MEDIUM_20X),
        ),
      ),
    );
  }
}
