import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/widgets/snack_shop_page_minus_button.dart';
import 'package:the_movie_booking/widgets/snack_shopping_page_plus_button.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
class PlusMinusAndItemCountsView extends StatelessWidget {
  const PlusMinusAndItemCountsView({
    Key? key,
    required this.onTapPlusButton,
    required this.onTapMinusButton,
    required this.selectedItemCounts,
    required this.itemCount
  }) : super(key: key);

  final Function onTapPlusButton;
  final Function onTapMinusButton;
  final int selectedItemCounts;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MARGIN_LARGE_100X,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SnackShoppingPagePlusButton(
            imageURL: PLUS_IMAGE,
            onTapPlusButton: onTapPlusButton,
          ),
          const SizedBox(width: MARGIN_MEDIUM_15X),
          Text(
            itemCount.toString(),
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: TEXT_MEDIUM,
                color: APP_COLOR_SECONDARY_COLOR),
          ),
          const SizedBox(width: MARGIN_MEDIUM_15X),
          SnackShoppingPageMinusButton(
            imageURL: MINUS_IMAGE,
            onTapMinusButton: onTapMinusButton,
          ),
        ],
      ),
    );
  }
}