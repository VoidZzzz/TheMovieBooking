import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';

import '../resources/colors.dart';
import 'app_default_button_large.dart';

class AlertDialogView extends StatelessWidget {
  const AlertDialogView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
      ),
      backgroundColor: APP_COLOR_SECONDARY_COLOR,
      contentPadding: const EdgeInsets.all(MARGIN_SMALL_2X),
      content: Container(
        height: MARGIN_XLARGE_490X,
        width: MARGIN_XLARGE_320X,
        decoration: BoxDecoration(
            color: APP_COLOR_PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),),
        child: Padding(
          padding: const EdgeInsets.all(MARGIN_MEDIUM_20X),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TicketCancellationTitleView(),
              const SizedBox(height: MARGIN_SMALL_10X),
              const TicketCancellationRuleOneView(),
              const SizedBox(height: MARGIN_MEDIUM_25X),
              const TicketCancellationRuleTwoView(),
              const SizedBox(height: MARGIN_SMALL_5X),
              const TicketCancellationRuleTwoAView(),
              const SizedBox(height: MARGIN_SMALL_10X),
              const TicketCancellationRuleTwoBView(),
              const SizedBox(height: MARGIN_MEDIUM_20X),
              const TicketCancellationRuleThreeView(),
              const TicketCancellationRuleFourView(),
              const SizedBox(height: MARGIN_MEDIUM_20X),
              AppDefaultButtonLarge(APP_COLOR_SECONDARY_COLOR, VOUCHER_PAGE_DIALOG_CLOSE_TEXT, () {
                Navigator.of(context).pop();
              })
            ],
          ),
        ),
      ),
    );
  }
}

class TicketCancellationRuleFourView extends StatelessWidget {
  const TicketCancellationRuleFourView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MARGIN_XLARGE_300X,
      height: MARGIN_MEDIUM_50X,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("2. ",
              style: GoogleFonts.inter(
                  color: WHITE_COLOR, fontWeight: FontWeight.w600),),
          SizedBox(
            width: MARGIN_XLARGE_249X,
            height: MARGIN_LARGE_70X,
            child: Text(
              VOUCHER_PAGE_TICKET_CANCELLATION_RULE_4,
              style: GoogleFonts.inter(
                  color: WHITE_COLOR, fontWeight: FontWeight.w600),
              maxLines: 2,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}

class TicketCancellationRuleThreeView extends StatelessWidget {
  const TicketCancellationRuleThreeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MARGIN_XLARGE_300X,
      height: MARGIN_LARGE_70X,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("1. ",
              style: GoogleFonts.inter(
                  color: WHITE_COLOR, fontWeight: FontWeight.w600)),
          SizedBox(
            width: MARGIN_XLARGE_250X,
            height: MARGIN_LARGE_70X,
            child: Text(
              VOUCHER_PAGE_TICKET_CANCELLATION_RULE_3,
              style: GoogleFonts.inter(
                  color: WHITE_COLOR, fontWeight: FontWeight.w600),
              maxLines: 3,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}

class TicketCancellationRuleTwoBView extends StatelessWidget {
  const TicketCancellationRuleTwoBView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.green,
      height: MARGIN_MEDIUM_50X,
      width: MARGIN_XLARGE_300X,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: MARGIN_MEDIUM_40X),
          child: Text(
            VOUCHER_PAGE_TICKET_CANCELLATION_RULE_2B,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                color: LIGHT_GREY_COLOR,
                fontSize: TEXT_MEDIUM),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}

class TicketCancellationRuleTwoAView extends StatelessWidget {
  const TicketCancellationRuleTwoAView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.green,
      height: MARGIN_MEDIUM_50X,
      width: MARGIN_XLARGE_300X,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: MARGIN_MEDIUM_40X),
          child: Text(
            VOUCHER_PAGE_TICKET_CANCELLATION_RULE_2A,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                color: LIGHT_GREY_COLOR,
                fontSize: TEXT_MEDIUM),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}

class TicketCancellationRuleTwoView extends StatelessWidget {
  const TicketCancellationRuleTwoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MARGIN_MEDIUM_30X,
          width: MARGIN_MEDIUM_30X,
          child: Image.asset(
            TICKET_IMAGE,
            color: WHITE_COLOR,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(width: MARGIN_SMALL_10X),
        Text(
          VOUCHER_PAGE_TICKET_CANCELLATION_RULE_2,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w600, color: WHITE_COLOR, fontSize: TEXT_LARGE_16X),
        )
      ],
    );
  }
}

class TicketCancellationRuleOneView extends StatelessWidget {
  const TicketCancellationRuleOneView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: MARGIN_MEDIUM_30X,
          width: MARGIN_MEDIUM_30X,
          child: Image.asset(
            CART_ITEM_COUNTS_IMAGE,
            color: WHITE_COLOR,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: MARGIN_SMALL_10X),
        Text(
          VOUCHER_PAGE_TICKET_CANCELLATION_RULE_1,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w600, color: WHITE_COLOR, fontSize: MARGIN_MEDIUM_16X),
        )
      ],
    );
  }
}

class TicketCancellationTitleView extends StatelessWidget {
  const TicketCancellationTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      VOUCHER_PAGE_TICKET_CANCELLAION_POLICY_TEXT,
      style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: WHITE_COLOR),
    );
  }
}
