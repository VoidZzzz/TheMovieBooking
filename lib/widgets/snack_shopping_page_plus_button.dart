import 'package:flutter/material.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';

class SnackShoppingPagePlusButton extends StatelessWidget {
  final String imageURL;
  final Function onTapPlusButton;

  const SnackShoppingPagePlusButton(
      {super.key, required this.imageURL, required this.onTapPlusButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapPlusButton();
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
