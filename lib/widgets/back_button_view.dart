import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';

class BackButtonView extends StatelessWidget {
  const BackButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.keyboard_arrow_left,
      color: WHITE_COLOR,
      size: MARGIN_MEDIUM_35X,
    );
  }
}
