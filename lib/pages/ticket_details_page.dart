import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/payment_page.dart';
import 'package:the_movie_booking/resources/strings.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/app_bar_back_arrow.dart';
import '../widgets/app_secondary_button.dart';
import '../widgets/calendar_time_and_location_view.dart';
import '../widgets/cinema_name_view.dart';
import '../widgets/dotted_line_view.dart';
import '../widgets/left_semi_circle_view.dart';
import '../widgets/right_semi_circle_view.dart';
import '../widgets/ticket_count_view.dart';
import '../widgets/title_text.dart';
import '../widgets/voucher_page_alert_dialog_view.dart';
import '../widgets/voucher_page_convenience_fee_view.dart';
import '../widgets/voucher_page_food_and_beverage_voucher_view.dart';
import '../widgets/voucher_page_ticket_cancellation_policy_view.dart';
import '../widgets/voucher_page_ticket_name_and_amount_view.dart';
import '../widgets/movie_title_View.dart';

class TicketDetailsPage extends StatelessWidget {
  const TicketDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: MARGIN_SMALLEST,
        backgroundColor: APP_COLOR_PRIMARY_COLOR,
        leading: const AppBarLeadingView(),
        title: const AppBarTitleView(),
        centerTitle: true,
      ),
      body: Container(
        color: APP_COLOR_PRIMARY_COLOR,
        child: Padding(
          padding: const EdgeInsets.all(MARGIN_MEDIUM_20X),
          child: Stack(
            children: const [
              TicketDetailsView(),
              Positioned(
                bottom: MARGIN_XLARGE_200X - MARGIN_MEDIUM_15X,
                left: 0,
                child: LeftSemiCircleContainer(),
              ),
              Positioned(
                bottom: MARGIN_XLARGE_200X - MARGIN_MEDIUM_15X,
                right: 0,
                child: RightSemiCircleContainer(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: const FloatingActionButtonView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            VOUCHER_CONFIRMATION_PAGE_GRADIENT_COLOR_1,
            VOUCHER_CONFIRMATION_PAGE_GRADIENT_COLOR_2,
            VOUCHER_CONFIRMATION_PAGE_GRADIENT_COLOR_3
          ],
        ),
        borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
      ),
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_MEDIUM_20X),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MovieTitleView(movieName: "John Wick - 4",),
            const SizedBox(height: MARGIN_SMALL_10X),
            const CinemaNameView(cinemaName: 'MingalarTime', cinemaStatus: '2',),
            const SizedBox(height: MARGIN_MEDIUM_20X),
            const CalendarTimeAndLocationView(selectedDate: 'SAT, June, 2023', selectedTime: '3:30PM',cinemaName: '',),
            const SizedBox(height: MARGIN_SMALL_10X),
            const TicketCountView(ticketCounts: 2,),
            const SizedBox(height: MARGIN_SMALL_10X),
            const TicketNameAndAmountView(seatNames: "", totalAmountsForTickets: 20000,),
            const SizedBox(height: MARGIN_SMALL_10X),
            const Divider(color: LIGHT_GREY_COLOR, thickness: MARGIN_XSMALL),
            const SizedBox(height: MARGIN_MEDIUM_20X),
            const FoodAndBeverageVoucherView(),
            const SizedBox(height: MARGIN_MEDIUM_30X),
            const DottedLineView(),
            const SizedBox(height: MARGIN_MEDIUM_30X),
            const ConvenienceFeeView(),
            const SizedBox(height: MARGIN_MEDIUM_15X),
            TicketCancellationPolicyView(
              buttonColor: BRIGHT_ORANGE_COLOR,
              onTapCancellation: () => showDialog(
                context: (context),
                builder: (context) => const AlertDialogView(),
              ),
            ),
            const SizedBox(height: MARGIN_MEDIUM_25X),
            const Divider(color: LIGHT_GREY_COLOR, thickness: MARGIN_XSMALL),
            const SizedBox(height: MARGIN_MEDIUM_25X),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_10X),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        color: APP_COLOR_SECONDARY_COLOR,
                        fontSize: TEXT_LARGE_18X),
                  ),
                  Text(
                    "22500Ks",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        color: APP_COLOR_SECONDARY_COLOR,
                        fontSize: TEXT_LARGE_18X),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FloatingActionButtonView extends StatelessWidget {
  const FloatingActionButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            RefundAmountTextView(),
            RefundAmountView(),
          ],
        ),
        const SizedBox(width: MARGIN_SMALL_10X),
        const CancelButtonView(),
      ],
    );
  }
}

class CancelButtonView extends StatelessWidget {
  const CancelButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSecondaryButton(
        buttonText: TICKET_DETAILS_PAGE_CANCEL_BOOKING_TEXT,
        buttonColor: BRIGHT_ORANGE_COLOR,
        buttonTextColor: WHITE_COLOR,
        onTap: () {});
  }
}

class RefundAmountView extends StatelessWidget {
  const RefundAmountView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "15000Ks",
      style: GoogleFonts.inter(
          color: BRIGHT_ORANGE_COLOR,
          fontSize: MARGIN_MEDIUM_20X,
          fontWeight: FontWeight.w700),
    );
  }
}

class RefundAmountTextView extends StatelessWidget {
  const RefundAmountTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      TICKET_DETAILS_PAGE_REFUND_TEXT,
      style: GoogleFonts.inter(
          color: WHITE_COLOR,
          fontSize: TEXT_LARGE_16X,
          fontWeight: FontWeight.w500),
    );
  }
}

class AppBarLeadingView extends StatelessWidget {
  const AppBarLeadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppBarBackArrow(
      iconSize: MARGIN_MEDIUM_25X,
    );
  }
}

class AppBarTitleView extends StatelessWidget {
  const AppBarTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TitleText(TICKET_DETAILS_PAGE_TITLE_TEXT);
  }
}
