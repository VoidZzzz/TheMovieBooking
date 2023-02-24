import 'package:flutter/material.dart';
import 'package:the_movie_booking/pages/cinema_details_page.dart';
import 'package:the_movie_booking/pages/seat_plan_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/widgets/app_bar_city_name_view.dart';
import 'package:the_movie_booking/widgets/app_bar_image_icon_view.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/widgets/cinema_listview.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';

class CinemaSelectionPage extends StatefulWidget {
  const CinemaSelectionPage({Key? key}) : super(key: key);

  @override
  State<CinemaSelectionPage> createState() => _CinemaSelectionPageState();
}

class _CinemaSelectionPageState extends State<CinemaSelectionPage> {
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
  List<String> weekdays = ['', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  List<String> cinemaType = ['2D', '3D', '3D IMAX', '3D DBOX'];

  List<DateTime> twoWeeks = [];
  var today = DateTime.now();

  void dateList() {
    var start = today;
    for (int i = 0; i < 14; i++) {
      twoWeeks.add(start.add(Duration(days: i)));
    }
    print('$twoWeeks');
    print('weekday ${today.weekday} month ${today.month} day ${today.day}');
    print(today);
  }

  @override
  void initState() {
    dateList();
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
            DateListView(list: twoWeeks, weekday: weekdays, months: months),
            CinemaTypeView(cinemaType: cinemaType),
            const CinemaAvailabilityBar(),
            CinemaListView(
              cinemaList: cinemaList,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SeatPlanPage();
                    },
                  ),
                );
              },
              onTapDetails: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return CinemaDetailsPage();
                    },
                  ),
                );
              },
            ),
          ],
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
                  borderRadius: const BorderRadius.all(
                      Radius.circular(MARGIN_SMALL_5X)),
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

  const DateListView({
    Key? key,
    required this.list,
    required this.weekday,
    required this.months,
  }) : super(key: key);

  @override
  State<DateListView> createState() => _DateListViewState();
}

class _DateListViewState extends State<DateListView> {
  List<bool> isSelectedDate = [
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MARGIN_LARGE_100X,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  for (int i = 0; i < isSelectedDate.length; i++) {
                    isSelectedDate[i] = false;
                  }
                  isSelectedDate[index] = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelectedDate[index]
                      ? APP_COLOR_SECONDARY_COLOR
                      : GREY_COLOR,
                  borderRadius: BorderRadius.circular(MARGIN_SMALL_5X),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_8X),
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
