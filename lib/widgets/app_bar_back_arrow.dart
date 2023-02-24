import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';

class AppBarBackArrow extends StatelessWidget {
  final double iconSize;const
  AppBarBackArrow({super.key, this.iconSize = TEXT_SMALL_12X});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.arrow_back_ios,size: iconSize,
      ),
    );
  }
}
