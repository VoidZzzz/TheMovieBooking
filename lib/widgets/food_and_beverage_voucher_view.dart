import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/widgets/voucher_page_food_and_beverage_voucher_title_text.dart';
import 'package:the_movie_booking/widgets/voucher_page_voucher_item_details_view.dart';
import '../data/data_vos/snack_vo.dart';
import '../pages/check_out_page.dart';

class FoodAndBeverageVoucherView extends StatefulWidget {
  const FoodAndBeverageVoucherView(
      {Key? key,
      required this.totalAmountsForSnack,
      required this.addedSnackList,
      required this.onRemoveSnack})
      : super(key: key);

  final int totalAmountsForSnack;
  final List<SnackVO?> addedSnackList;
  final Function(int) onRemoveSnack;

  @override
  State<FoodAndBeverageVoucherView> createState() =>
      _FoodAndBeverageVoucherViewState();
}

class _FoodAndBeverageVoucherViewState
    extends State<FoodAndBeverageVoucherView> {
  bool iconSwitch = true;
  int? finalAmountForSnack;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
        child: Column(
          children: [
            FoodAndBeverageVoucherTitleText(
                totalAmountsForSnack: widget.totalAmountsForSnack,
                onTap: () {
                  setState(() {
                    iconSwitch = !iconSwitch;
                  });
                },
                iconSwitch: iconSwitch, finalAmountForSnack: finalAmountForSnack,),
            iconSwitch
                ? VoucherItemDetailsView(
                    totalAmountForSnack: widget.totalAmountsForSnack,
                    onRemoveSnack: (finalAmount){
                      widget.onRemoveSnack(finalAmount);
                      setState(() {
                        finalAmountForSnack = finalAmount;
                      });
                    },
                    addedSnackList: widget.addedSnackList,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
