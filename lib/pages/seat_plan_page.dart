import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_booking_model_impl.dart';
import 'package:the_movie_booking/pages/snack_shop_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';
import 'package:the_movie_booking/widgets/app_secondary_button.dart';

import '../authentication/data/data_vos/seat_vo.dart';
import '../resources/dimens.dart';
import '../widgets/app_bar_back_arrow.dart';

class SeatPlanPage extends StatefulWidget {
  const SeatPlanPage(
      {Key? key, required this.bookingDate, required this.cinemaDayTimeSlotsId})
      : super(key: key);

  final String bookingDate;
  final String cinemaDayTimeSlotsId;

  @override
  State<SeatPlanPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SeatPlanPage> {
  int totalTicket = 0;
  int totalAmount = 0;

  final TheMovieBookingModelImpl _theMovieBookingModelImpl =
      TheMovieBookingModelImpl();
  late String userToken;
  List<List<SeatVO>?>? seatPlan;

  @override
  void initState() {
    userToken =
        _theMovieBookingModelImpl.getUserDataFromDatabase()?.token ?? "";
    _theMovieBookingModelImpl
        .getSeatingPlan("Bearer $userToken", widget.cinemaDayTimeSlotsId ?? "",
            widget.bookingDate ?? "")
        .then((response) {
      setState(() {
        seatPlan = response ?? [];
        debugPrint(
            "=============================================> SEAT ${seatPlan?[0]?[1].seatName}");
      });
    }).catchError((error) {
      debugPrint(
          "Error======================================> ${error.toString()}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: MARGIN_SMALLEST,
        backgroundColor: APP_COLOR_PRIMARY_COLOR,
        leading: const AppBarLeadingView(),
      ),
      body: Column(
        children: [
          const TheaterAndScreenView(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                SEAT_PLAN_PAGE_NORMAL_CLASS_TEXT,
                style: GoogleFonts.dmSans(
                    fontSize: TEXT_LARGE_16X,
                    color: GREY_COLOR,
                    fontWeight: FontWeight.w400),
              ),
              (seatPlan != null)
                  ? SeatPlanView(seatPlan: seatPlan ?? [], onTappedSeat: (int? listViewIndex, int? gridViewIndex) {
                setState(() {
                  seatPlan?[listViewIndex!]?[gridViewIndex!].isSelected =
                  (seatPlan?[listViewIndex]?[gridViewIndex].isSelected ==
                      false)
                      ? true
                      : false;
                  totalTicket ++;
                  totalAmount = (2500 * (totalTicket * (seatPlan?[listViewIndex ?? 0]?[gridViewIndex ?? 0].price ?? 0)));
                });
              },)
                  : const SizedBox(
                      height: 440,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: APP_COLOR_SECONDARY_COLOR,
                        ),
                      ),
                    ),
            ],
          ),

          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: 8,
          //   itemBuilder: (context, index) {
          //     if (index == 0) {
          //       return const SeatTypeTextView(
          //         text: SEAT_PLAN_PAGE_NORMAL_CLASS_TEXT,
          //       );
          //     } else if (index == 2) {
          //       return const SeatTypeTextView(
          //         text: SEAT_PLAN_PAGE_EXECUTIVE_CLASS_TEXT,
          //       );
          //     } else if (index == 4) {
          //       return const SeatTypeTextView(
          //         text: SEAT_PLAN_PAGE_PREMIUM_CLASS_TEXT,
          //       );
          //     } else if (index == 6) {
          //       return const SeatTypeTextView(
          //         text: SEAT_PLAN_PAGE_GOLD_CLASS_TEXT,
          //       );
          //     } else if (index == 1) {
          //       return SeatPlanGridView(
          //           seatList: normalSeatList,
          //           onSelect: (index) {
          //             if (normalSeatList[index] == 'SELECTION') {
          //               setState(() {
          //                 normalSeatList[index] = 'AVAILABLE';
          //                 totalTicket -= 1;
          //                 totalAmount -= 4500;
          //               });
          //             } else if (normalSeatList[index] == 'AVAILABLE') {
          //               setState(() {
          //                 normalSeatList[index] = 'SELECTION';
          //                 totalTicket += 1;
          //                 totalAmount += 4500;
          //               });
          //             }
          //           });
          //     } else if (index == 3) {
          //       return SeatPlanGridView(
          //           seatList: executiveSeatList,
          //           onSelect: (index) {
          //             if (executiveSeatList[index] == 'SELECTION') {
          //               setState(() {
          //                 executiveSeatList[index] = 'AVAILABLE';
          //                 totalTicket -= 1;
          //                 totalAmount -= 6500;
          //               });
          //             } else if (executiveSeatList[index] == 'AVAILABLE') {
          //               setState(() {
          //                 executiveSeatList[index] = 'SELECTION';
          //                 totalTicket += 1;
          //                 totalAmount += 6500;
          //               });
          //             }
          //           });
          //     } else if (index == 5) {
          //       return SeatPlanGridView(
          //           seatList: premiumSeatList,
          //           onSelect: (index) {
          //             if (premiumSeatList[index] == 'SELECTION') {
          //               setState(() {
          //                 premiumSeatList[index] = 'AVAILABLE';
          //                 totalTicket -= 1;
          //                 totalAmount -= 8500;
          //               });
          //             } else if (premiumSeatList[index] == 'AVAILABLE') {
          //               setState(() {
          //                 premiumSeatList[index] = 'SELECTION';
          //                 totalTicket += 1;
          //                 totalAmount += 8500;
          //               });
          //             }
          //           });
          //     } else if (index == 7) {
          //       return CoupleSeatPlanGridView(
          //           seatList: goldSeatList,
          //           onSelect: (index) {
          //             if (goldSeatList[index] == 'SELECTION') {
          //               setState(() {
          //                 goldSeatList[index] = 'AVAILABLE';
          //                 totalTicket -= 1;
          //                 totalAmount -= 10000;
          //               });
          //             } else if (goldSeatList[index] == 'AVAILABLE') {
          //               setState(() {
          //                 goldSeatList[index] = 'SELECTION';
          //                 totalTicket += 1;
          //                 totalAmount += 10000;
          //               });
          //             }
          //           });
          //     } else {
          //       return Container();
          //     }
          //   },
          // ),
          const SeatTypeView(),
          const SizedBox(
            height: MARGIN_MEDIUM_40X,
          ),
          TicketInfoView(
            ticketCount: totalTicket,
            amount: totalAmount,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SnackShopPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SeatPlanView extends StatefulWidget {
  final List<List<SeatVO>?>? seatPlan;
  final Function(int? listViewIndex, int? gridViewIndex) onTappedSeat;
  const SeatPlanView({super.key, required this.seatPlan,required this.onTappedSeat});

  @override
  State<SeatPlanView> createState() => _SeatPlanViewState();
}

class _SeatPlanViewState extends State<SeatPlanView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.seatPlan?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: SeatRowView(
                seatPlanForEachRow: widget.seatPlan?[index] ?? [],
                onTappedSeat: (gridIndex)=> widget.onTappedSeat(index, gridIndex),
              ),
            );
          }),
    );
  }
}

class SeatRowView extends StatefulWidget {
  final List<SeatVO>? seatPlanForEachRow;
  final Function(int?) onTappedSeat;
  const SeatRowView(
      {Key? key, required this.seatPlanForEachRow, required this.onTappedSeat})
      : super(key: key);

  @override
  State<SeatRowView> createState() => _SeatRowViewState();
}

class _SeatRowViewState extends State<SeatRowView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.2),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: widget.seatPlanForEachRow?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 18,
              mainAxisExtent: 21,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 1),
          itemBuilder: (context, index) {
            if (widget.seatPlanForEachRow?[index].type == "text") {
              return Center(
                child: Text(
                  widget.seatPlanForEachRow?[index].symbol ?? "",
                  style: GoogleFonts.inter(
                      fontSize: TEXT_SMALL_12X,
                      color: WHITE_COLOR,
                      fontWeight: FontWeight.w500),
                ),
              );
            } else if (widget.seatPlanForEachRow?[index].type == "available") {
              return SizedBox(
                child: InkWell(
                  onTap: () => widget.onTappedSeat(index),
                  child: Image.asset(
                    "images/whiteChair.png",
                    fit: BoxFit.cover,
                    color:
                        (widget.seatPlanForEachRow?[index].isSelected == true)
                            ? APP_COLOR_SECONDARY_COLOR
                            : WHITE_COLOR,
                  ),
                ),
              );
            } else if (widget.seatPlanForEachRow?[index].type == "taken") {
              return SizedBox(
                child: Image.asset("images/blackChair.png"),
              );
            } else if (widget.seatPlanForEachRow?[index].type == "space") {
              return const SizedBox();
            } else {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  color: APP_COLOR_SECONDARY_COLOR,
                ),
              );
            }
          }),
    );
  }
}

class TicketInfoView extends StatelessWidget {
  final int ticketCount;
  final int amount;
  final Function onTap;

  const TicketInfoView({
    Key? key,
    required this.ticketCount,
    required this.amount,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$ticketCount Tickets',
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              '$amount Kyats',
              style: const TextStyle(color: APP_COLOR_SECONDARY_COLOR),
            ),
          ],
        ),
        AppSecondaryButton(
          buttonText: SEAT_PLAN_PAGE_BUY_TICKETS_TEXT,
          buttonColor: APP_COLOR_SECONDARY_COLOR,
          buttonTextColor: SECONDARY_BUTTON_TEXT_COLOR,
          onTap: () {
            onTap();
          },
        )
      ],
    );
  }
}

class SeatTypeView extends StatelessWidget {
  const SeatTypeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_MEDIUM_45X,
      color: DARK_GREY_COLOR_2,
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_15X),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              CircleAvatar(
                backgroundColor: WHITE_COLOR,
                radius: MARGIN_SMALL_5X,
              ),
              SizedBox(
                width: MARGIN_SMALL_8X,
              ),
              Text(
                SEAT_PLAN_PAGE_AVAILABLE_TEXT,
                style: TextStyle(color: GREY_COLOR),
              ),
            ],
          ),
          Row(
            children: const [
              CircleAvatar(
                backgroundColor: GREY_COLOR,
                radius: MARGIN_SMALL_5X,
              ),
              SizedBox(
                width: MARGIN_SMALL_8X,
              ),
              Text(
                SEAT_PLAN_PAGE_TAKEN_TEXT,
                style: TextStyle(color: GREY_COLOR),
              ),
            ],
          ),
          Row(
            children: const [
              CircleAvatar(
                backgroundColor: APP_COLOR_SECONDARY_COLOR,
                radius: MARGIN_SMALL_5X,
              ),
              SizedBox(
                width: MARGIN_SMALL_8X,
              ),
              Text(
                SEAT_PLAN_PAGE_SELECTION_TEXT,
                style: TextStyle(color: GREY_COLOR),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CoupleSeatPlanGridView extends StatelessWidget {
  final List<String> seatList;
  final Function(int) onSelect;

  const CoupleSeatPlanGridView(
      {Key? key, required this.seatList, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_15X),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 22,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 11,
            crossAxisSpacing: MARGIN_SMALL_2X,
            mainAxisSpacing: MARGIN_SMALL_4X),
        itemBuilder: (context, index) {
          if (index == 0 || index == 10 || index == 11 || index == 21) {
            return SeatTypeTextView(
              text: seatList[index],
            );
          } else if (seatList[index] == '') {
            return Container();
          } else if (index == 1 || index == 9 || index == 12 || index == 20) {
            return GestureDetector(
              onTap: () {
                onSelect(index);
              },
              child: seatList[index] == 'AVAILABLE'
                  ? Image.asset(
                      COUPLE_SEAT_IMAGE,
                    )
                  : seatList[index] == 'TAKEN'
                      ? Image.asset(
                          COUPLE_SEAT_IMAGE,
                          color: GREY_COLOR,
                        )
                      : seatList[index] == 'SELECTION'
                          ? Image.asset(
                              COUPLE_SEAT_IMAGE,
                              color: APP_COLOR_SECONDARY_COLOR,
                            )
                          : Container(),
            );
          } else {
            return GestureDetector(
              onTap: () {
                onSelect(index);
              },
              child: seatList[index] == 'AVAILABLE'
                  ? const SeatImageView(image: WHITE_CHAIR_IMAGE)
                  : seatList[index] == 'TAKEN'
                      ? const SeatImageView(image: BLACK_CHAIR_IMAGE)
                      : seatList[index] == 'SELECTION'
                          ? const SeatImageView(
                              image: WHITE_CHAIR_IMAGE,
                              isGreen: true,
                            )
                          : Container(),
            );
          }
        },
      ),
    );
  }
}

class SeatPlanGridView extends StatelessWidget {
  final List<String> seatList;
  final Function(int) onSelect;

  const SeatPlanGridView(
      {Key? key, required this.seatList, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_15X),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 24,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 12,
            crossAxisSpacing: MARGIN_SMALL_2X,
            mainAxisSpacing: MARGIN_SMALL_4X),
        itemBuilder: (context, index) {
          if (index == 0 || index == 11 || index == 12 || index == 23) {
            return SeatTypeTextView(text: seatList[index]);
          } else if (seatList[index] == '') {
            return Container();
          } else {
            return GestureDetector(
              onTap: () {
                onSelect(index);
              },
              child: seatList[index] == 'AVAILABLE'
                  ? const SeatImageView(image: WHITE_CHAIR_IMAGE)
                  : seatList[index] == 'TAKEN'
                      ? const SeatImageView(image: BLACK_CHAIR_IMAGE)
                      : seatList[index] == 'SELECTION'
                          ? const SeatImageView(
                              image: WHITE_CHAIR_IMAGE,
                              isGreen: true,
                            )
                          : Container(),
            );
          }
        },
      ),
    );
  }
}

class SeatImageView extends StatelessWidget {
  final String image;
  final bool isGreen;

  const SeatImageView({Key? key, required this.image, this.isGreen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      color: isGreen ? APP_COLOR_SECONDARY_COLOR : null,
    );
  }
}

class SeatTypeTextView extends StatelessWidget {
  final String text;

  const SeatTypeTextView({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: GREY_COLOR),
      textAlign: TextAlign.center,
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

class TheaterAndScreenView extends StatelessWidget {
  const TheaterAndScreenView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(CURVE_IMAGE),
        Positioned(
          bottom: MARGIN_MEDIUM_20X,
          left: MARGIN_LARGE_100X,
          right: MARGIN_LARGE_100X,
          child: SizedBox(
            width: MARGIN_LARGE_100X + MARGIN_MEDIUM_50X,
            height: MARGIN_LARGE_60X,
            child: Center(
              child: Text(
                SEAT_PLAN_PAGE_SCREEN_TEXT,
                style: GoogleFonts.dmSans(
                    color: WHITE_COLOR,
                    fontWeight: FontWeight.w400,
                    fontSize: TEXT_LARGE_16X,
                    letterSpacing: MARGIN_SMALL_2X + MARGIN_SMALL_1X),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
