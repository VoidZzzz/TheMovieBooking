import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/images.dart';

import '../resources/colors.dart';

class VoucherItemDetailsView extends StatelessWidget {
  const VoucherItemDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: MARGIN_MEDIUM_20X),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      height: MARGIN_MEDIUM_20X,
                      width: MARGIN_MEDIUM_20X,
                      child: Image.asset(
                        CANCEL_IMAGE,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: MARGIN_SMALL_8X),
                    Text(
                      "Potatoe Chips (Qt.1)",
                      style: GoogleFonts.dmSans(
                          fontSize: TEXT_MEDIUM,
                          fontWeight: FontWeight.w700,
                          color: LIGHT_GREY_COLOR),
                    ),
                  ],
                ),
              ),
              Text(
                "1000Ks",
                style: GoogleFonts.dmSans(
                    fontSize: TEXT_MEDIUM,
                    fontWeight: FontWeight.w700,
                    color: LIGHT_GREY_COLOR),
              ),
            ],
          ),
          const SizedBox(height: MARGIN_SMALL_8X),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      height: MARGIN_MEDIUM_20X,
                      width: MARGIN_MEDIUM_20X,
                      child: Image.asset(
                        CANCEL_IMAGE,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: MARGIN_SMALL_8X),
                    Text(
                      "CocaCola Large (Qt.1)",
                      style: GoogleFonts.dmSans(
                          fontSize: TEXT_MEDIUM,
                          fontWeight: FontWeight.w700,
                          color: LIGHT_GREY_COLOR),
                    ),
                  ],
                ),
              ),
              Text(
                "1000Ks",
                style: GoogleFonts.dmSans(
                    fontSize: TEXT_MEDIUM,
                    fontWeight: FontWeight.w700,
                    color: LIGHT_GREY_COLOR),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
