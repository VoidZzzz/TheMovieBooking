import 'package:flutter/material.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';

class AppBarImageIconView extends StatelessWidget {
  final String appBarImageURL;
  final double imageScale;
  final double containerHeight;
  final double containerWidth;
  final Color imageColor;

  const AppBarImageIconView(this.appBarImageURL,
      {super.key,
      this.imageScale = 1,
      this.containerHeight = MARGIN_MEDIUM_15X,
      this.containerWidth = MARGIN_MEDIUM_15X,
      this.imageColor = WHITE_COLOR});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHeight,
      width: containerWidth,
      child: Image.asset(
        appBarImageURL,
        fit: BoxFit.fitHeight,
        color: imageColor,
        scale: imageScale,
      ),
    );
  }
}
