import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/images.dart';

class IMDBView extends StatelessWidget {
  const IMDBView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_MEDIUM_20X,
      width: MARGIN_MEDIUM_32X,
      child: Image.asset(
        IMDB_IMAGE,
        fit: BoxFit.cover,
      ),
    );
  }
}