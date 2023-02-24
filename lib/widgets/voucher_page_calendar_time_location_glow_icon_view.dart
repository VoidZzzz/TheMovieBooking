import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import '../resources/colors.dart';
class CalendarTimeLocationGlowIconView extends StatelessWidget {
  final IconData icon;
  const CalendarTimeLocationGlowIconView(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_MEDIUM_20X,
      width: MARGIN_MEDIUM_20X,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: VOUCHER_CONFIRMATION_ICON_GLOW_COLOR,
            blurStyle: BlurStyle.normal,
            blurRadius: MARGIN_SMALL_5X)
      ], color: VOUCHER_CONFIRMATION_ICON_BACKGROUND_COLOR),
      child: Icon(
        icon,
        color: APP_COLOR_SECONDARY_COLOR,
        size: MARGIN_MEDIUM_20X,
      ),
    );
  }
}