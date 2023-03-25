import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';
import 'package:the_movie_booking/widgets/plus_minus_and_item_counts_view.dart';

import '../data/data_vos/snack_vo.dart';

class SnackBoxView extends StatefulWidget {
  final Function onTapPlusButton;
  final Function onTapMinusButton;
  final Function onTapAddButton;
  final int selectedItemCounts;
  final SnackVO? snack;
  final int? itemCounts;

  const SnackBoxView(
      {super.key,
      required this.onTapPlusButton,
      required this.onTapMinusButton,
      required this.selectedItemCounts,
      required this.snack,
      required this.itemCounts,
      required this.onTapAddButton});

  @override
  State<SnackBoxView> createState() => _SnackBoxViewState();
}

class _SnackBoxViewState extends State<SnackBoxView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            SNACK_SELECTION_PAGE_SNACK_BOX_GRADIENT_COLOR_1,
            SNACK_SELECTION_PAGE_SNACK_BOX_GRADIENT_COLOR_2
          ],
        ),
        color: Colors.grey,
        borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: MARGIN_SMALL_10X,
            right: MARGIN_SMALL_10X,
            top: MARGIN_SMALL_10X,
            bottom: MARGIN_SMALLEST),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MARGIN_LARGE_110X,
              child: Image.network(
                widget.snack?.image ?? "",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: MARGIN_MEDIUM_15X),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.snack?.name ?? "",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: TEXT_SMALL_12X,
                      color: Colors.white),
                ),
                const SizedBox(height: MARGIN_SMALL_5X),
                Text(
                 '${widget.snack!.price! * 1000} Ks',
                  style: GoogleFonts.inter(
                      color: APP_COLOR_SECONDARY_COLOR,
                      fontSize: TEXT_SMALL_12X),
                ),
                const SizedBox(height: MARGIN_SMALL_5X),
                GestureDetector(
                  onTap: () {
                    widget.onTapPlusButton();
                  },
                  child: (widget.snack!.quantity! > 0)
                      ? SizedBox(
                          width: MARGIN_LARGE_150X,
                          height: MARGIN_MEDIUM_30X,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: MARGIN_SMALLEST,
                                right: -MARGIN_SMALL_10X,
                                child: PlusMinusAndItemCountsView(
                                    selectedItemCounts:
                                        widget.selectedItemCounts,
                                    onTapPlusButton: widget.onTapPlusButton,
                                    onTapMinusButton: widget.onTapMinusButton, itemCount: widget.itemCounts),
                              ),
                            ],
                          ),
                        )
                      : SnackBoxAddButtonView(onTapAddButton: widget.onTapAddButton,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SnackBoxAddButtonView extends StatelessWidget {
  const SnackBoxAddButtonView({
    Key? key,
    required this.onTapAddButton
  }) : super(key: key);
  final Function onTapAddButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapAddButton(),
      child: Container(
        height: MARGIN_MEDIUM_30X,
        decoration: BoxDecoration(
          color: APP_COLOR_SECONDARY_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_SMALL_4X),
        ),
        child: Center(
          child: Text(
            SNACK_SHOP_PAGE_ADD_TEXT,
            style: GoogleFonts.inter(
                color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
