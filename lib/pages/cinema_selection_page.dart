import 'package:flutter/material.dart';
import 'package:the_movie_booking/pages/cinema_details_page.dart';
import 'package:the_movie_booking/pages/seat_plan_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/widgets/app_bar_city_name_view.dart';
import 'package:the_movie_booking/widgets/app_bar_image_icon_view.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/widgets/cinema_listview.dart';
import '../authentication/data/data_vos/cinema_vo.dart';
import '../authentication/data/models/the_movie_booking_model.dart';
import '../authentication/data/models/the_movie_booking_model_impl.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import 'package:intl/intl.dart';

class CinemaSelectionPage extends StatefulWidget {
  const CinemaSelectionPage({Key? key}) : super(key: key);

  @override
  State<CinemaSelectionPage> createState() => _CinemaSelectionPageState();
}

class _CinemaSelectionPageState extends State<CinemaSelectionPage> {

  /// UI variables
  bool isExpand = false;
  List<String> cinemaList = [
    'JCGV : Junction City',
    'JCGV : City Mall',
    'Mingalar Cinema Gold Class'
  ];
  List<String> months = [
    '',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  List<bool> isSelectedDateList = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<String> weekdays = ['', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  List<String> cinemaType = ['2D', '3D', '3D IMAX', '3D DBOX'];
  List<DateTime> twoWeeks = [];
  var today = DateTime.now();

  void dateList() {
    var start = today;
    for (int i = 0; i < 14; i++) {
      twoWeeks.add(
        start.add(
          Duration(days: i),
        ),
      );
    }
  }

  /// Network Variables
  TheMovieBookingModel theMovieBookingModel = TheMovieBookingModelImpl();
  String userToken = "";
  List<CinemaVO>? cinemaAndShowTimeList;
  String selectedDateForApi = "";
  String defaultDateForApi =
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";

  @override
  void initState() {
    dateList();

    /// getToken From Database
    setState(() {
      userToken = theMovieBookingModel.getUserDataFromDatabase()?.token ?? "";
    });

    /// getCinemaAndShowTime by Default
    theMovieBookingModel
        .getCinemaAndShowTimeByDate(defaultDateForApi, 'Bearer $userToken')
        .then((cinemaAndShowTime) {
      setState(() {
        cinemaAndShowTimeList = cinemaAndShowTime.data;
      });
      debugPrint(
          "CinemaAndShowTime===================================>${cinemaAndShowTime.data?.first.cinema}");
      debugPrint(
          "CinemaAndShowTime===================================>${cinemaAndShowTimeList?.length}");
    }).catchError((error) {
      debugPrint("Error ========================> $error");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: AppBar(
        backgroundColor: APP_COLOR_PRIMARY_COLOR,
        elevation: MARGIN_SMALLEST,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const AppBarTitleView(),
      ),

      /// Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: MARGIN_SMALL_10X,
            ),
            DateListView(
              list: twoWeeks,
              weekday: weekdays,
              months: months,
              onTapSelectedDate: (selectedDate, index) {
                setState(() {
                  for (int i = 0; i < isSelectedDateList.length; i++) {
                    isSelectedDateList[i] = false;
                  }
                  isSelectedDateList[index] = true;
                  selectedDateForApi =
                      "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                  print(
                      '=================================> SELECTED DATE = $selectedDateForApi');

                  /// getCinemaAndShowTime On User Action
                  theMovieBookingModel
                      .getCinemaAndShowTimeByDate(
                          selectedDateForApi, 'Bearer $userToken')
                      .then((cinemaAndShowTime) {
                    setState(() {
                      cinemaAndShowTimeList = cinemaAndShowTime.data;
                    });
                    debugPrint(
                        "===================================> CINEMA AND SHOWTIME ON USER ACTION  ${cinemaAndShowTime.data?.first.cinema}");
                    debugPrint(
                        "===================================> CINEMA LENGTH ON USER ACTION   ${cinemaAndShowTimeList?.length}");
                  }).catchError((error) {
                    debugPrint("Error ========================> $error");
                  });
                });
              },
              isSelectedDateList: isSelectedDateList,
            ),
            CinemaTypeView(cinemaType: cinemaType),
            const CinemaAvailabilityBar(),
            (cinemaAndShowTimeList != null)
                ? CinemaListView(
                    cinemaAndShowTimeList: cinemaAndShowTimeList ?? [],
                    onTapCinema: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SeatPlanPage(bookingDate: (selectedDateForApi.isEmpty)? defaultDateForApi : selectedDateForApi, cinemaDayTimeSlotsId: "22",);
                          },
                        ),
                      );
                    },
                    onTapDetails: (index) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const CinemaDetailsPage();
                          },
                        ),
                      );
                    },
                    onTapExpanded: (index) {
                      setState(() {
                        // assign false to all index expect selected index
                        // excepted selected index to expand one at a time
                        for (int i = 0;
                            i < cinemaAndShowTimeList!.length;
                            i++) {
                          if (i != index) {
                            cinemaAndShowTimeList?[i].isExpanded = false;
                          }
                        }

                        // toggle true false for selected index
                        cinemaAndShowTimeList?[index].isExpanded =
                            cinemaAndShowTimeList?[index].isExpanded == true
                                ? false
                                : true; //
                        // debugPrint('------------------------${cinemaAndShowTimeList?[index].isExpanded}');
                      });
                    },
                  )
                : const CircularLoadingView(),
          ],
        ),
      ),
    );
  }
}

class CircularLoadingView extends StatelessWidget {
  const CircularLoadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: MARGIN_XLARGE_300X,
      child: Center(
        child: CircularProgressIndicator(
          color: APP_COLOR_SECONDARY_COLOR,
        ),
      ),
    );
  }
}

class CinemaTypeView extends StatelessWidget {
  const CinemaTypeView({
    Key? key,
    required this.cinemaType,
  }) : super(key: key);

  final List<String> cinemaType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_20X),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: cinemaType
            .map(
              (e) => Container(
                height: MARGIN_MEDIUM_30X,
                padding: const EdgeInsets.symmetric(
                    vertical: MARGIN_SMALL_4X, horizontal: MARGIN_MEDIUM_15X),
                decoration: BoxDecoration(
                  color: APP_COLOR_PRIMARY_COLOR,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(MARGIN_SMALL_5X)),
                  border: Border.all(
                    color: Colors.white,
                    width: MARGIN_SMALL_1X,
                  ),
                ),
                child: Text(
                  e,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
            .toList(),
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
    return Row(
      children: const [
        Spacer(),
        AppBarImageIconView("images/location.png"),
        SizedBox(width: MARGIN_SMALL_8X),
        AppBarCityNameView("Yangon"),
        SizedBox(width: MARGIN_MEDIUM_20X),
        AppBarImageIconView("images/searchIcon1.png"),
        SizedBox(width: MARGIN_MEDIUM_20X),
        AppBarImageIconView("images/filterImage.png"),
        SizedBox(width: MARGIN_SMALL_10X)
      ],
    );
  }
}

class DateListView extends StatefulWidget {
  final List<DateTime> list;
  final List<String> weekday;
  final List<String> months;
  final Function(DateTime, int) onTapSelectedDate;
  final List<bool> isSelectedDateList;

  const DateListView(
      {Key? key,
      required this.list,
      required this.weekday,
      required this.months,
      required this.onTapSelectedDate,
      required this.isSelectedDateList})
      : super(key: key);

  @override
  State<DateListView> createState() => _DateListViewState();
}

class _DateListViewState extends State<DateListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_LARGE_100X,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => widget.onTapSelectedDate(widget.list[index], index),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.isSelectedDateList[index]
                      ? APP_COLOR_SECONDARY_COLOR
                      : GREY_COLOR,
                  borderRadius: BorderRadius.circular(MARGIN_SMALL_5X),
                ),
                margin: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_8X),
                width: MARGIN_LARGE_70X,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TopContainerView(),
                    index == 0
                        ? const Text(
                            'Today',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        : index == 1
                            ? const Text('Tomorrow',
                                style: TextStyle(fontWeight: FontWeight.bold))
                            : Text(widget.weekday[widget.list[index].weekday],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                    Text(widget.months[widget.list[index].month],
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LeftSmallSemiCircle(),
                        Text(
                          '${widget.list[index].day}',
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const RightSmallSemiCircle(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class TopContainerView extends StatelessWidget {
  const TopContainerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(MARGIN_SMALL_5X)),
      ),
      height: MARGIN_SMALL_5X,
      width: MARGIN_MEDIUM_18X,
    );
  }
}

class RightSmallSemiCircle extends StatelessWidget {
  const RightSmallSemiCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MARGIN_SMALL_5X),
            bottomLeft: Radius.circular(MARGIN_SMALL_5X)),
      ),
      height: MARGIN_SMALL_8X,
      width: MARGIN_SMALL_6X,
    );
  }
}

class LeftSmallSemiCircle extends StatelessWidget {
  const LeftSmallSemiCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(MARGIN_SMALL_5X),
            bottomRight: Radius.circular(MARGIN_SMALL_5X)),
      ),
      height: MARGIN_SMALL_8X,
      width: MARGIN_SMALL_6X,
    );
  }
}

class CinemaAvailabilityBar extends StatelessWidget {
  const CinemaAvailabilityBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
      height: MARGIN_MEDIUM_50X - MARGIN_SMALL_5X,
      color: CINEMA_PAGE_MOVIE_TYPE_COLOR,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                CINEMA_SELECTION_PAGE_AVAILABLE_TEXT,
                style: TextStyle(color: APP_COLOR_SECONDARY_COLOR),
              ),
            ],
          ),
          const FillingFastBarView(),
          const AlmostFullBarView(),
        ],
      ),
    );
  }
}

class FillingFastBarView extends StatelessWidget {
  const FillingFastBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          backgroundColor: CINEMA_PAGE_FILLING_FAST_COLOR,
          radius: MARGIN_SMALL_5X,
        ),
        SizedBox(
          width: MARGIN_SMALL_8X,
        ),
        Text(
          CINEMA_SELECTION_PAGE_FILLING_FAST_TEXT,
          style: TextStyle(color: CINEMA_PAGE_FILLING_FAST_COLOR),
        ),
      ],
    );
  }
}

class AlmostFullBarView extends StatelessWidget {
  const AlmostFullBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          backgroundColor: CINEMA_PAGE_ALMOST_FULL_COLOR,
          radius: MARGIN_SMALL_5X,
        ),
        SizedBox(
          width: MARGIN_SMALL_8X,
        ),
        Text(
          CINEMA_SELECTION_PAGE_ALMOST_FULL_TEXT,
          style: TextStyle(color: CINEMA_PAGE_ALMOST_FULL_COLOR),
        ),
      ],
    );
  }
}
