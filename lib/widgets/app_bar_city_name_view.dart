import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';


class AppBarCityNameView extends StatelessWidget {
  final String cityName;
  const AppBarCityNameView(this.cityName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      cityName,
      style: GoogleFonts.inter(
          color: APP_COLOR_TERTIARY_COLOR_1,
          fontSize: TEXT_LARGE_16X,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic),
    );
  }
}