import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';

class AppBarBackArrow extends StatelessWidget {
  final double iconSize;
  final Color color;
  const AppBarBackArrow(
      {super.key, this.iconSize = TEXT_SMALL_12X, this.color = WHITE_COLOR});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      },
      child: Icon(
        Icons.arrow_back_ios,
        size: iconSize,
        color: color,
      ),
    );
  }
}
