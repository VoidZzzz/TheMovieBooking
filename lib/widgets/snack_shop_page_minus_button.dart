import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';

import '../resources/colors.dart';

class SnackShoppingPageMinusButton extends StatelessWidget {
  final String imageURL;
  final Function onTapMinusButton;

  const SnackShoppingPageMinusButton(
      {super.key, required this.imageURL, required this.onTapMinusButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapMinusButton();
      },
      child: Container(
        height: MARGIN_MEDIUM_20X,
        width: MARGIN_MEDIUM_20X,
        decoration: BoxDecoration(
          color: APP_COLOR_SECONDARY_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM_20X),
        ),
        child: Image.asset(
          imageURL,
          scale: 3.5,
        ),
      ),
    );
  }
}
