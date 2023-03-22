import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/payment_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/widgets/app_bar_back_arrow.dart';
import 'package:the_movie_booking/widgets/app_default_button_large.dart';
import 'package:the_movie_booking/widgets/app_default_button_medium.dart';
import 'package:the_movie_booking/widgets/app_secondary_button.dart';
import 'package:the_movie_booking/widgets/title_text.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../widgets/calendar_time_and_location_view.dart';
import '../widgets/cinema_name_view.dart';
import '../widgets/dotted_line_view.dart';
import '../widgets/left_semi_circle_view.dart';
import '../widgets/right_semi_circle_view.dart';
import '../widgets/ticket_count_view.dart';
import '../widgets/voucher_page_alert_dialog_view.dart';
import '../widgets/voucher_page_convenience_fee_view.dart';
import '../widgets/voucher_page_food_and_beverage_voucher_view.dart';
import '../widgets/voucher_page_ticket_cancellation_policy_view.dart';
import '../widgets/voucher_page_ticket_name_and_amount_view.dart';
import '../widgets/movie_title_View.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage(
      {Key? key,
      required this.selectedSeatList,
      required this.totalTicketsForSeat,
      required this.totalAmountForSeat,
      required this.movieName,
      required this.selectedDate,
      required this.cinemaName,
      required this.cinemaStatus,
      required this.selectedTime})
      : super(key: key);

  final int totalTicketsForSeat;
  final int totalAmountForSeat;
  final List<String> selectedSeatList;
  final String movieName;
  final String cinemaName;
  final String cinemaStatus;
  final String selectedDate;
  final String selectedTime;

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  late int totalAmounts = 500 + widget.totalAmountForSeat;
  late String seatNames = widget.selectedSeatList.join(", ");

  @override
  void initState() {
    debugPrint(
        "===================> ${widget.totalAmountForSeat}  ${widget.totalTicketsForSeat}  ${widget.selectedSeatList} ${widget.selectedDate} ${widget.selectedTime}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APP_COLOR_PRIMARY_COLOR,
        automaticallyImplyLeading: false,
        elevation: MARGIN_SMALLEST,
        leading: const AppBarLeadingView(),
        title: const AppBarTitleView(),
        centerTitle: true,
      ),
      body: Container(
        color: APP_COLOR_PRIMARY_COLOR,
        child: Padding(
          padding: const EdgeInsets.all(MARGIN_MEDIUM_20X),
          child: Stack(
            children: [
              TicketDetailsView(
                seatNames: seatNames,
                totalTicketsForSeat: widget.totalTicketsForSeat,
                totalAmountsForSeat: widget.totalAmountForSeat,
                totalAmounts: totalAmounts,
                movieName: widget.movieName,
                selectedTime: widget.selectedTime,
                cinemaStatus: widget.cinemaStatus,
                cinemaName: widget.cinemaName,
                selectedDate: widget.selectedDate,
              ),
              const Positioned(
                bottom: MARGIN_XLARGE_200X - MARGIN_MEDIUM_15X,
                left: MARGIN_SMALLEST,
                child: LeftSemiCircleContainer(),
              ),
              const Positioned(
                bottom: MARGIN_XLARGE_200X - MARGIN_MEDIUM_15X,
                right: MARGIN_SMALLEST,
                child: RightSemiCircleContainer(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: AppSecondaryButton(
        buttonText: CHECKOUT_PAGE_CONTINUE_TEXT,
        buttonColor: APP_COLOR_SECONDARY_COLOR,
        buttonTextColor: SECONDARY_BUTTON_TEXT_COLOR,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PaymentPage(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView(
      {Key? key,
      required this.seatNames,
      required this.totalTicketsForSeat,
      required this.totalAmountsForSeat,
      required this.totalAmounts,
      required this.movieName,
      required this.selectedTime,
      required this.cinemaStatus,
      required this.cinemaName,
      required this.selectedDate})
      : super(key: key);

  final int totalTicketsForSeat;
  final int totalAmountsForSeat;
  final String seatNames;
  final int totalAmounts;
  final String movieName;
  final String cinemaName;
  final String cinemaStatus;
  final String selectedDate;
  final String selectedTime;

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
          borderRadius: BorderRadius.circular(MARGIN_SMALL_8X)),
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_MEDIUM_20X),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieTitleView(
              movieName: movieName,
            ),
            const SizedBox(height: MARGIN_SMALL_10X),
            CinemaNameView(
              cinemaName: cinemaName,
              cinemaStatus: cinemaStatus,
            ),
            const SizedBox(height: MARGIN_MEDIUM_20X),
            CalendarTimeAndLocationView(
              selectedDate: selectedDate,
              selectedTime: selectedTime,
              cinemaName: cinemaName,
            ),
            const SizedBox(height: MARGIN_SMALL_10X),
            TicketCountView(
              ticketCounts: totalTicketsForSeat,
            ),
            const SizedBox(height: MARGIN_SMALL_10X),
            TicketNameAndAmountView(
              totalAmountsForTickets: totalAmountsForSeat,
              seatNames: seatNames,
            ),
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
              buttonColor:
                  VOUCHER_CONFIRMATION_PAGE_CANCELATION_POLICY_BOX_COLOR,
              onTapCancellation: () => showDialog(
                context: (context),
                builder: (context) => const AlertDialogView(),
              ),
            ),
            const SizedBox(height: MARGIN_MEDIUM_25X),
            const Divider(color: LIGHT_GREY_COLOR, thickness: MARGIN_XSMALL),
            const SizedBox(height: MARGIN_MEDIUM_25X),
            TotalAmountView(
              totalAmounts: totalAmounts,
            )
          ],
        ),
      ),
    );
  }
}

class TotalAmountView extends StatelessWidget {
  const TotalAmountView({Key? key, required this.totalAmounts})
      : super(key: key);
  final int totalAmounts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_10X),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            CHECKOUT_PAGE_TOTAL_TEXT,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                color: APP_COLOR_SECONDARY_COLOR,
                fontSize: TEXT_LARGE_18X),
          ),
          Text(
            "${totalAmounts.toString()} Ks",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                color: APP_COLOR_SECONDARY_COLOR,
                fontSize: TEXT_LARGE_18X),
          )
        ],
      ),
    );
  }
}

class AppBarTitleView extends StatelessWidget {
  const AppBarTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TitleText(CHECKOUT_PAGE_TITLE_TEXT);
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
