import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/widgets/voucher_page_food_and_beverage_voucher_title_text.dart';
import 'package:the_movie_booking/widgets/voucher_page_voucher_item_details_view.dart';

import '../pages/check_out_page.dart';

class FoodAndBeverageVoucherView extends StatefulWidget {
  const FoodAndBeverageVoucherView({
    Key? key,
  }) : super(key: key);

  @override
  State<FoodAndBeverageVoucherView> createState() =>
      _FoodAndBeverageVoucherViewState();
}

class _FoodAndBeverageVoucherViewState
    extends State<FoodAndBeverageVoucherView> {
  bool iconSwitch = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_SMALL_1X),
        child: Column(
          children: [
            FoodAndBeverageVoucherTitleText(
                onTap: () {
                  setState(() {
                    iconSwitch = !iconSwitch;
                  });
                },
                iconSwitch: iconSwitch),
            iconSwitch ? const VoucherItemDetailsView() : Container()
          ],
        ),
      ),
    );
  }
}