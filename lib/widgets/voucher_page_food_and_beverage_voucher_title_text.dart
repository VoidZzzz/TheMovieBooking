import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';

import '../resources/colors.dart';

class FoodAndBeverageVoucherTitleText extends StatefulWidget {
  final Function onTap;
  final bool iconSwitch;
  final int totalAmountsForSnack;
  final int? finalAmountForSnack;
  const FoodAndBeverageVoucherTitleText(
      {super.key,
      required this.iconSwitch,
      required this.onTap,
      required this.totalAmountsForSnack,
      required this.finalAmountForSnack});

  @override
  State<FoodAndBeverageVoucherTitleText> createState() =>
      _FoodAndBeverageVoucherTitleTextState();
}

class _FoodAndBeverageVoucherTitleTextState
    extends State<FoodAndBeverageVoucherTitleText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: MARGIN_MEDIUM_25X,
          child: Row(
            children: [
              Image.asset(
                CART_ITEM_COUNTS_IMAGE,
                color: WHITE_COLOR,
              ),
              const SizedBox(width: MARGIN_SMALL_5X),
              Text(
                CHECKOUT_PAGE_FNB_TEXT,
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    fontSize: TEXT_LARGE_16X,
                    color: WHITE_COLOR),
              ),
              GestureDetector(
                onTap: () {
                  widget.onTap();
                },
                child: widget.iconSwitch
                    ? const Icon(
                        Icons.keyboard_arrow_up,
                        color: WHITE_COLOR,
                        size: MARGIN_MEDIUM_25X,
                      )
                    : const Icon(
                        Icons.keyboard_arrow_down,
                        color: WHITE_COLOR,
                        size: MARGIN_MEDIUM_25X,
                      ),
              ),
            ],
          ),
        ),
        Text(
          (widget.finalAmountForSnack == null)
              ? (widget.totalAmountsForSnack > 0)
                  ? "${widget.totalAmountsForSnack.toString()} Ks"
                  : "-"
              : (widget.finalAmountForSnack! > 0)
                  ? "${widget.finalAmountForSnack.toString()} Ks"
                  : "-",
          style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w700,
              fontSize: MARGIN_MEDIUM_16X,
              color: WHITE_COLOR),
        )
      ],
    );
  }
}
