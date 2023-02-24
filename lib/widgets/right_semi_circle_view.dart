import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import '../resources/colors.dart';

class RightSemiCircleContainer extends StatelessWidget {
  const RightSemiCircleContainer({
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
          topLeft: Radius.circular(MARGIN_MEDIUM_20X),
          bottomLeft: Radius.circular(MARGIN_MEDIUM_20X),
        ),
      ),
    );
  }
}
