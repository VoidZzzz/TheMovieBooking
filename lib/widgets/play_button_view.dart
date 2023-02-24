import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/images.dart';
class PlayButtonView extends StatelessWidget {
  const PlayButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MARGIN_MEDIUM_25X,
      child: Image.asset(
        PLAY_BUTTON_IMAGE,
        fit: BoxFit.cover,
      ),
    );
  }
}