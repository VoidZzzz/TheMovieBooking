import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';

import '../resources/colors.dart';

class ShareButtonView extends StatelessWidget {
  const ShareButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.share,
      color: WHITE_COLOR,
      size: MARGIN_MEDIUM_25X,
    );
  }
}
