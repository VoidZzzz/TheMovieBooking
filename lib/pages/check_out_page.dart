import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/payment_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/widgets/app_bar_back_arrow.dart';
import 'package:the_movie_booking/widgets/app_secondary_button.dart';
import 'package:the_movie_booking/widgets/title_text.dart';
import '../data/data_vos/snack_vo.dart';
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
import '../widgets/food_and_beverage_voucher_view.dart';
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
      required this.selectedTime,
      required this.totalAmountForSnack,
      required this.addedSnackList,
      required this.movieId,
      required this.cinemaDaysTimeslotId,
      required this.cinemaLocation,
      required this.selectedDateTime})
      : super(key: key);

  final int totalTicketsForSeat;
  final int totalAmountForSeat;
  final int totalAmountForSnack;
  final List<String> selectedSeatList;
  final String movieName;
  final String cinemaName;
  final String cinemaStatus;
  final String selectedDate;
  final String selectedTime;
  final List<SnackVO?> addedSnackList;
  final int movieId;
  final int cinemaDaysTimeslotId;
  final String cinemaLocation;
  final DateTime selectedDateTime;

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  late int totalAmounts =
      500 + widget.totalAmountForSeat + widget.totalAmountForSnack;
  late String seatNames = widget.selectedSeatList.join(", ");

  @override
  void initState() {
    debugPrint(
        "===================> SNACK LIST INIT ${widget.totalAmountForSeat}  ${widget.totalTicketsForSeat} ${widget.addedSnackList}");
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.77,
            child: Stack(
              children: [
                TicketDetailsView(
                  selectedDateTime: widget.selectedDateTime,
                  cinemaLocation: widget.cinemaLocation,
                  addedSnackList: widget.addedSnackList,
                  totalAmountsForSnack: widget.totalAmountForSnack,
                  seatNames: seatNames,
                  totalTicketsForSeat: widget.totalTicketsForSeat,
                  totalAmountsForSeat: widget.totalAmountForSeat,
                  totalAmounts: totalAmounts,
                  movieName: widget.movieName,
                  selectedTime: widget.selectedTime,
                  cinemaStatus: widget.cinemaStatus,
                  cinemaName: widget.cinemaName,
                  selectedDate: widget.selectedDate,
                  onRemoveSnack: (finalAmount) {
                    setState(() {
                      totalAmounts =
                          500 + widget.totalAmountForSeat + finalAmount;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: AppSecondaryButton(
        buttonText: CHECKOUT_PAGE_CONTINUE_TEXT,
        buttonColor: APP_COLOR_SECONDARY_COLOR,
        buttonTextColor: SECONDARY_BUTTON_TEXT_COLOR,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PaymentPage(
              cinemaLocation: widget.cinemaLocation,
              bookingDateTime: widget.selectedDateTime,
              cinemaName: widget.cinemaName,
              bookingDate: widget.selectedDate,
              seatList: widget.selectedSeatList,
              movieId: widget.movieId,
              addedSnackList: widget.addedSnackList,
              cinemaDaysTimeslotsId: widget.cinemaDaysTimeslotId,
            ),
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
      required this.selectedDate,
      required this.totalAmountsForSnack,
      required this.addedSnackList,
      required this.onRemoveSnack,
      required this.cinemaLocation,
      required this.selectedDateTime})
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
  final int totalAmountsForSnack;
  final List<SnackVO?> addedSnackList;
  final Function(int finalAmount) onRemoveSnack;
  final String cinemaLocation;
  final DateTime selectedDateTime;

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
        padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_20X),
        child: SingleChildScrollView(
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
                child: CalendarTimeAndLocationView(
                  selectedDateTime: selectedDateTime,
                  selectedDate: selectedDate,
                  selectedTime: selectedTime,
                  cinemaLocation: cinemaLocation,
                ),
              ),
              // const SizedBox(height: MARGIN_SMALL_10X),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
                child: TicketCountView(
                  ticketCounts: totalTicketsForSeat,
                ),
              ),
              const SizedBox(height: MARGIN_SMALL_10X),
              TicketNameAndAmountView(
                totalAmountsForTickets: totalAmountsForSeat,
                seatNames: seatNames,
              ),
              const SizedBox(height: MARGIN_SMALL_10X),
              const DividerView(),
              const SizedBox(height: MARGIN_MEDIUM_20X),
              FoodAndBeverageVoucherView(
                onRemoveSnack: (finalAmount) {
                  onRemoveSnack(finalAmount);
                },
                totalAmountsForSnack: totalAmountsForSnack,
                addedSnackList: addedSnackList,
              ),
              const SizedBox(height: MARGIN_MEDIUM_15X),
              const SemiCirclesView(),
              const SizedBox(height: MARGIN_MEDIUM_20X),
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
              const SizedBox(height: MARGIN_MEDIUM_15X),
              const DividerView(),
              const SizedBox(height: MARGIN_MEDIUM_15X),
              TotalAmountView(
                totalAmounts: totalAmounts,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DividerView extends StatelessWidget {
  const DividerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
      child: Divider(color: LIGHT_GREY_COLOR, thickness: MARGIN_XSMALL),
    );
  }
}

class SemiCirclesView extends StatelessWidget {
  const SemiCirclesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_MEDIUM_40X,
      width: double.maxFinite,
      child: Stack(
        children: const [
          Positioned(
            left: 0,
            child: LeftSemiCircleContainer(),
          ),
          Align(
            alignment: Alignment.center,
            child: DottedLineView(),
          ),
          Positioned(
            right: 0,
            child: RightSemiCircleContainer(),
          )
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_30X),
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
