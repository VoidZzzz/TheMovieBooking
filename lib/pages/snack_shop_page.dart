import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_booking_model_impl.dart';
import 'package:the_movie_booking/pages/check_out_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';
import 'package:the_movie_booking/widgets/app_bar_image_icon_view.dart';
import 'package:the_movie_booking/widgets/title_text_large.dart';
import '../authentication/data/data_vos/snack_category_vo.dart';
import '../authentication/data/data_vos/snack_vo.dart';
import '../authentication/data/models/the_movie_booking_model.dart';
import '../resources/dimens.dart';
import '../widgets/app_bar_back_arrow.dart';
import '../widgets/plus_minus_and_item_counts_view.dart';
import '../widgets/snack_box_view_page.dart';
import '../widgets/snack_shop_page_minus_button.dart';
import '../widgets/snack_shopping_page_plus_button.dart';
import '../widgets/title_text.dart';

class SnackShopPage extends StatefulWidget {
  const SnackShopPage(
      {Key? key,
      required this.selectedSeatList,
      required this.totalAmountForSeat,
      required this.totalTicketsForSeat,
      required this.movieName,
      required this.selectedTime,
      required this.cinemaStatus,
      required this.cinemaName,
      required this.selectedDate,
      required this.cinemaDaysTimeslotId,
      required this.movieId,
      required this.cinemaLocation,
      required this.selectedDateTime})
      : super(key: key);
  final List<String> selectedSeatList;
  final int totalTicketsForSeat;
  final int totalAmountForSeat;
  final String movieName;
  final String cinemaName;
  final String cinemaStatus;
  final String selectedDate;
  final String selectedTime;
  final int cinemaDaysTimeslotId;
  final int movieId;
  final String cinemaLocation;
  final DateTime selectedDateTime;

  @override
  State<SnackShopPage> createState() => _SnackShopPageState();
}

class _SnackShopPageState extends State<SnackShopPage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  bool iconSwitch = false;
  int cartItemCounts = 0;
  int selectedItemCounts = 0;
  bool isShow = false;


  int currentIndex = 0;
  int totalAmountForSnacks = 0;
  List<SnackVO?> addedSnackList = [];

  /// Network Variables
  final TheMovieBookingModel _movieBookingModel = TheMovieBookingModelImpl();
  String userToken = "";
  List<SnackVO>? allSnackList;
  List<SnackVO>? comboSnackList;
  List<SnackVO>? snackList;
  List<SnackVO>? popCornSnackList;
  List<SnackVO>? beverageSnackList;
  List<SnackCategoryVO>? snackCategoryList;

  @override
  void initState() {
    setState(() {
      userToken = _movieBookingModel.getUserDataFromDatabase()?.token ?? "";
    });

    /// Get Snack Category from Network
    _movieBookingModel
        .getSnackCategory("Bearer $userToken")
        .then((snackCategoryResponse) {
      setState(() {
        snackCategoryList = snackCategoryResponse.data ?? [];
      });
      print(
          "===============================================> SNACK LIST INIT STATE = ${snackCategoryList?.first.title}");
    });

    /// Get All Snack from Network
    _movieBookingModel
        .getSnacks("0", "Bearer $userToken")
        .then((snackResponse) {
      setState(() {
        allSnackList = snackResponse.data ?? [];
      });
      print(
          "===============================================> ALL SNACK QUANTITY INIT STATE = ${allSnackList?.first.quantity}");
      print(
          "===============================================> ALL SNACK LIST INIT STATE = ${allSnackList?.first.price}");
    });

    /// Assign TabBar Controller
    _controller = TabController(length: 5, vsync: this);
    _controller.addListener(
      () {
        setState(
          () {
            currentIndex = _controller.index;
          },
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        elevation: MARGIN_SMALLEST,
        automaticallyImplyLeading: false,
        backgroundColor: APP_COLOR_PRIMARY_COLOR,
        leading: const AppBarLeadingView(),
        title: AppBarTitleView(
          selectedDateTime: widget.selectedDateTime,
          cinemaLocation: widget.cinemaLocation,
          cinemaDaysTimeslotId: widget.cinemaDaysTimeslotId,
          movieId: widget.movieId,
          addedSnackList: addedSnackList,
          totalAmountsForSnack: totalAmountForSnacks,
          cinemaName: widget.cinemaName,
          cinemaStatus: widget.cinemaStatus,
          selectedDate: widget.selectedDate,
          selectedTime: widget.selectedTime,
          totalTicketsForSeat: widget.totalTicketsForSeat,
          selectedSeatList: widget.selectedSeatList,
          totalAmountsForSeat: widget.totalAmountForSeat,
          movieName: widget.movieName,
        ),
      ),

      /// Body
      body: Stack(
        children: [
          (allSnackList != null)
              ? Column(
                  children: [
                    TabBarTitleView(
                      snackCategory: snackCategoryList ?? [],
                      controller: _controller,
                      onTapTabBarTitle: (tabBarIndex) {
                        /// get Snacks from Network
                        if (tabBarIndex == 1) {
                          if (comboSnackList == null) {
                            _movieBookingModel
                                .getSnacks(
                                    tabBarIndex.toString(), "Bearer $userToken")
                                .then((snackResponse) {
                              setState(() {
                                comboSnackList = snackResponse.data ?? [];
                              });
                              print(
                                  "===============================================> ALL OTHER SNACK LIST = ${allSnackList?.length}");
                            });
                          }
                        } else if (tabBarIndex == 2) {
                          if (snackList == null) {
                            _movieBookingModel
                                .getSnacks(
                                    tabBarIndex.toString(), "Bearer $userToken")
                                .then((snackResponse) {
                              setState(() {
                                snackList = snackResponse.data ?? [];
                              });
                              print(
                                  "===============================================> ALL OTHER SNACK LIST = ${allSnackList?.length}");
                            });
                          }
                        } else if (tabBarIndex == 3) {
                          if (popCornSnackList == null) {
                            _movieBookingModel
                                .getSnacks(
                                    tabBarIndex.toString(), "Bearer $userToken")
                                .then((snackResponse) {
                              setState(() {
                                popCornSnackList = snackResponse.data ?? [];
                              });
                              print(
                                  "===============================================> ALL OTHER SNACK LIST = ${allSnackList?.length}");
                            });
                          }
                        } else if (tabBarIndex == 4) {
                          if (beverageSnackList == null) {
                            _movieBookingModel
                                .getSnacks(
                                    tabBarIndex.toString(), "Bearer $userToken")
                                .then((snackResponse) {
                              setState(() {
                                beverageSnackList = snackResponse.data ?? [];
                              });
                              print(
                                  "===============================================> ALL OTHER SNACK LIST = ${allSnackList?.length}");
                            });
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.76,
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _controller,
                        children: [
                          AlItemsTabBarView(
                            onTapPlusButton: (index) {
                              setState(() {
                                allSnackList![index].quantity =
                                    allSnackList![index].quantity! + 1;
                                totalAmountForSnacks +=
                                    allSnackList![index].price! * 1000;
                              });
                            },
                            onTapMinusButton: (index) {
                              setState(() {
                                allSnackList![index].quantity =
                                    allSnackList![index].quantity! - 1;
                                totalAmountForSnacks -=
                                    allSnackList![index].price! * 1000;
                                if (allSnackList![index].quantity == 0) {
                                  addedSnackList.remove(allSnackList?[index]);
                                }
                              });
                            },
                            selectedItemCounts: selectedItemCounts,
                            allSnackList: allSnackList,
                            onTapAddButton: (index) {
                              setState(() {
                                if (!(addedSnackList
                                    .contains(allSnackList?[index]))) {
                                  addedSnackList.add(allSnackList?[index]);
                                }
                                allSnackList![index].quantity =
                                    allSnackList![index].quantity! + 1;
                                totalAmountForSnacks +=
                                    allSnackList![index].price! * 1000;
                              });
                              debugPrint(
                                  "=======================> ${allSnackList?[index].quantity}");
                            },
                          ),
                          ComboItemsTabBarView(
                            onTapPlusButton: (index) {
                              setState(() {
                                totalAmountForSnacks +=
                                    comboSnackList![index].price! * 1000;
                                comboSnackList![index].quantity =
                                    comboSnackList![index].quantity! + 1;
                              });
                            },
                            isShow: isShow,
                            onTapMinusButton: (index) {
                              setState(() {
                                totalAmountForSnacks -=
                                    comboSnackList![index].price! * 1000;
                                comboSnackList![index].quantity =
                                    comboSnackList![index].quantity! - 1;
                                if (comboSnackList![index].quantity == 0) {
                                  addedSnackList.remove(comboSnackList?[index]);
                                }
                              });
                            },
                            selectedItemCounts: selectedItemCounts,
                            snackList: comboSnackList,
                            onTapAddButton: (index) {
                              setState(() {
                                if (!(addedSnackList
                                    .contains(comboSnackList?[index]))) {
                                  addedSnackList.add(comboSnackList?[index]);
                                }
                                totalAmountForSnacks +=
                                    comboSnackList![index].price! * 1000;
                                comboSnackList?[index].quantity =
                                    comboSnackList![index].quantity! + 1;
                              });
                            },
                          ),
                          SnackItemsTabBarView(
                            onTapPlusButton: (index) {
                              setState(() {
                                totalAmountForSnacks +=
                                    snackList![index].price! * 1000;
                                snackList?[index].quantity =
                                    snackList![index].quantity! + 1;
                              });
                            },
                            isShow: isShow,
                            onTapMinusButton: (index) {
                              setState(() {
                                totalAmountForSnacks -=
                                    snackList![index].price! * 1000;
                                snackList?[index].quantity =
                                    snackList![index].quantity! - 1;
                                if (snackList![index].quantity == 0) {
                                  addedSnackList.remove(snackList?[index]);
                                }
                              });
                            },
                            selectedItemCounts: selectedItemCounts,
                            snackList: snackList,
                            onTapAddButton: (index) {
                              setState(() {
                                if (!(addedSnackList
                                    .contains(snackList?[index]))) {
                                  addedSnackList.add(snackList?[index]);
                                }
                                totalAmountForSnacks +=
                                    snackList![index].price! * 1000;
                                snackList?[index].quantity =
                                    snackList![index].quantity! + 1;
                              });
                            },
                          ),
                          PopCornItemsTabBarView(
                            onTapPlusButton: (index) {
                              setState(() {
                                totalAmountForSnacks +=
                                    popCornSnackList![index].price! * 1000;
                                popCornSnackList?[index].quantity =
                                    popCornSnackList![index].quantity! + 1;
                              });
                            },
                            isShow: isShow,
                            onTapMinusButton: (index) {
                              setState(() {
                                totalAmountForSnacks -=
                                    popCornSnackList![index].price! * 1000;
                                popCornSnackList?[index].quantity =
                                    popCornSnackList![index].quantity! - 1;
                                if (popCornSnackList![index].quantity == 0) {
                                  addedSnackList
                                      .remove(popCornSnackList?[index]);
                                }
                              });
                            },
                            selectedItemCounts: selectedItemCounts,
                            snackList: popCornSnackList,
                            onTapAddButton: (index) {
                              setState(() {
                                if (!(addedSnackList
                                    .contains(popCornSnackList?[index]))) {
                                  addedSnackList.add(popCornSnackList?[index]);
                                }
                                totalAmountForSnacks +=
                                    popCornSnackList![index].price! * 1000;
                                popCornSnackList?[index].quantity =
                                    popCornSnackList![index].quantity! + 1;
                              });
                            },
                          ),
                          BeverageItemsTabBarView(
                            onTapPlusButton: (index) {
                              setState(() {
                                totalAmountForSnacks +=
                                    beverageSnackList![index].price! * 1000;
                                beverageSnackList?[index].quantity =
                                    beverageSnackList![index].quantity! + 1;
                              });
                            },
                            isShow: isShow,
                            onTapMinusButton: (index) {
                              setState(() {
                                totalAmountForSnacks -=
                                    beverageSnackList![index].price! * 1000;
                                beverageSnackList?[index].quantity =
                                    beverageSnackList![index].quantity! - 1;
                                if (beverageSnackList![index].quantity == 0) {
                                  addedSnackList
                                      .remove(beverageSnackList?[index]);
                                }
                              });
                            },
                            selectedItemCounts: selectedItemCounts,
                            snackList: beverageSnackList,
                            onTapAddButton: (index) {
                              setState(() {
                                if (!(addedSnackList
                                    .contains(beverageSnackList?[index]))) {
                                  addedSnackList.add(beverageSnackList?[index]);
                                }
                                totalAmountForSnacks +=
                                    beverageSnackList![index].price! * 1000;
                                beverageSnackList?[index].quantity =
                                    beverageSnackList![index].quantity! + 1;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: APP_COLOR_SECONDARY_COLOR,
                    ),
                  ),
                ),

          /// Bottom Bar View
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: APP_COLOR_PRIMARY_COLOR,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MARGIN_MEDIUM_20X),
                  topRight: Radius.circular(MARGIN_MEDIUM_20X),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: MARGIN_MEDIUM_25X, vertical: MARGIN_MEDIUM_15X),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    iconSwitch
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: addedSnackList.length,
                            itemBuilder: (context, index) {
                              return AddedSnackItem(
                                snackItem: addedSnackList[index],
                                onTapPlusButton: () {
                                  setState(
                                    () {
                                      totalAmountForSnacks +=
                                          addedSnackList[index]!.price! * 1000;
                                      addedSnackList[index]!.quantity =
                                          addedSnackList[index]!.quantity! + 1;
                                    },
                                  );
                                },
                                onTapMinusButton: () {
                                  setState(
                                    () {
                                      totalAmountForSnacks -=
                                          addedSnackList[index]!.price! * 1000;
                                      if (addedSnackList[index]!.quantity! ==
                                          1) {
                                        addedSnackList[index]!.quantity =
                                            addedSnackList[index]!.quantity! -
                                                1;
                                        addedSnackList.removeAt(index);
                                      } else {
                                        addedSnackList[index]!.quantity =
                                            addedSnackList[index]!.quantity! -
                                                1;
                                      }
                                    },
                                  );
                                },
                              );
                            })
                        : Container(),
                    const SizedBox(
                      height: MARGIN_SMALL_5X,
                    ),

                    /// Shopping Cart Bottom Bar
                    Container(
                      height: MARGIN_MEDIUM_50X,
                      decoration: BoxDecoration(
                        color: APP_COLOR_SECONDARY_COLOR,
                        borderRadius: BorderRadius.circular(MARGIN_SMALL_10X),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(MARGIN_SMALL_10X),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: MARGIN_MEDIUM_40X,
                              width: MARGIN_LARGE_70X,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: MARGIN_SMALL_5X,
                                  ),
                                  Badge(
                                    badgeContent: Text(
                                      addedSnackList.length.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: TEXT_SMALLEST,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    badgeStyle: const BadgeStyle(
                                        badgeColor: Colors.deepOrange),
                                    showBadge: addedSnackList.isNotEmpty
                                        ? true
                                        : false,
                                    child: SizedBox(
                                      height: MARGIN_MEDIUM_30X,
                                      width: MARGIN_MEDIUM_30X,
                                      child:
                                          Image.asset(CART_ITEM_COUNTS_IMAGE),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          iconSwitch = !iconSwitch;
                                        },
                                      );
                                    },
                                    child: iconSwitch
                                        ? const Icon(
                                            Icons.keyboard_arrow_up,
                                            color: Colors.black,
                                            size: MARGIN_MEDIUM_30X,
                                          )
                                        : const Icon(
                                            Icons.keyboard_arrow_down,
                                            color: Colors.black,
                                            size: MARGIN_MEDIUM_30X,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CheckOutPage(
                                        selectedDateTime: widget.selectedDateTime,
                                        cinemaLocation: widget.cinemaLocation,
                                        cinemaDaysTimeslotId: widget.cinemaDaysTimeslotId,
                                        movieId: widget.movieId,
                                        addedSnackList: addedSnackList,
                                        totalAmountForSnack: totalAmountForSnacks,
                                        cinemaName: widget.cinemaName,
                                        cinemaStatus: widget.cinemaStatus,
                                        selectedDate: widget.selectedDate,
                                        selectedTime: widget.selectedTime,
                                        movieName: widget.movieName,
                                        selectedSeatList:
                                            widget.selectedSeatList,
                                        totalTicketsForSeat:
                                            widget.totalTicketsForSeat,
                                        totalAmountForSeat:
                                            widget.totalAmountForSeat,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: MARGIN_MEDIUM_50X,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${totalAmountForSnacks.toString()} Ks",
                                      style: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: TEXT_LARGE_16X),
                                    ),
                                    const Icon(
                                      Icons.chevron_right,
                                      size: MARGIN_MEDIUM_25X,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarTitleView extends StatelessWidget {
  const TabBarTitleView(
      {Key? key,
      required this.snackCategory,
      required this.controller,
      required this.onTapTabBarTitle})
      : super(key: key);

  final List<SnackCategoryVO>? snackCategory;
  final TabController controller;
  final Function(int?) onTapTabBarTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_10X),
      child: TabBar(
        physics: const BouncingScrollPhysics(),
        onTap: (index) {
          onTapTabBarTitle(controller.index);
        },
        controller: controller,
        indicatorColor: APP_COLOR_SECONDARY_COLOR,
        isScrollable: true,
        labelPadding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_18X),
        labelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600, fontSize: TEXT_LARGE_16X),
        tabs: [
          const Tab(text: SNACK_SHOP_PAGE_ALL_SNACK_TEXT),
          Tab(text: snackCategory?[0].title ?? ""),
          Tab(text: snackCategory?[1].title ?? ""),
          Tab(text: snackCategory?[2].title ?? ""),
          Tab(text: snackCategory?[3].title ?? "")
        ],
      ),
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
  const AppBarTitleView(
      {Key? key,
      required this.totalTicketsForSeat,
      required this.selectedSeatList,
      required this.totalAmountsForSeat,
      required this.movieName,
      required this.selectedTime,
      required this.selectedDate,
      required this.cinemaStatus,
      required this.cinemaName,
      required this.totalAmountsForSnack,
      required this.addedSnackList,
      required this.movieId,
      required this.cinemaDaysTimeslotId,
      required this.cinemaLocation,
      required this.selectedDateTime})
      : super(key: key);
  final int totalAmountsForSeat;
  final int totalTicketsForSeat;
  final List<String> selectedSeatList;
  final String movieName;
  final String cinemaName;
  final String cinemaStatus;
  final String selectedDate;
  final String selectedTime;
  final int totalAmountsForSnack;
  final List<SnackVO?> addedSnackList;
  final int movieId;
  final int cinemaDaysTimeslotId;
  final String cinemaLocation;
  final DateTime selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const TitleText(SNACK_SHOP_PAGE_TITLE_TEXT),
        const SizedBox(width: MARGIN_LARGE_90X),
        const AppBarImageIconView(SEARCH_ICON_IMAGE),
        const SizedBox(width: MARGIN_MEDIUM_25X),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return CheckOutPage(
                    selectedDateTime: selectedDateTime,
                    cinemaLocation: cinemaLocation,
                    cinemaDaysTimeslotId: cinemaDaysTimeslotId,
                      movieId: movieId,
                    addedSnackList: addedSnackList,
                    totalAmountForSnack: totalAmountsForSnack,
                    cinemaName: cinemaName,
                    cinemaStatus: cinemaStatus,
                    selectedTime: selectedTime,
                    selectedDate: selectedDate,
                    selectedSeatList: selectedSeatList,
                    totalTicketsForSeat: totalTicketsForSeat,
                    totalAmountForSeat: totalAmountsForSeat,
                    movieName: movieName,
                  );
                },
              ),
            );
          },
          child: const TitleTextLarge(SNACK_SHOP_PAGE_ACTION_TEXT),
        ),
      ],
    );
  }
}

class BeverageItemsTabBarView extends StatelessWidget {
  final Function(int) onTapPlusButton;
  final Function(int) onTapMinusButton;
  final bool isShow;
  final int selectedItemCounts;
  final List<SnackVO>? snackList;
  final Function(int) onTapAddButton;

  const BeverageItemsTabBarView(
      {super.key,
      required this.onTapPlusButton,
      required this.isShow,
      required this.onTapMinusButton,
      required this.selectedItemCounts,
      required this.snackList,
      required this.onTapAddButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_25X),
      child: GridView.builder(
          itemCount: snackList?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: MARGIN_MEDIUM_25X,
              crossAxisSpacing: MARGIN_MEDIUM_25X,
              mainAxisExtent: MARGIN_XLARGE_220X),
          itemBuilder: (context, index) {
            return SnackBoxView(
              onTapPlusButton: () {
                onTapPlusButton(index);
              },
              onTapMinusButton: () => onTapMinusButton(index),
              selectedItemCounts: selectedItemCounts,
              snack: snackList?[index],
              itemCounts: snackList?[index].quantity ?? 0,
              onTapAddButton: () => onTapAddButton(index),
            );
          }),
    );
  }
}

class PopCornItemsTabBarView extends StatelessWidget {
  final Function(int) onTapPlusButton;
  final Function(int) onTapMinusButton;
  final bool isShow;
  final int selectedItemCounts;
  final List<SnackVO>? snackList;
  final Function(int) onTapAddButton;

  const PopCornItemsTabBarView(
      {super.key,
      required this.onTapPlusButton,
      required this.isShow,
      required this.onTapMinusButton,
      required this.selectedItemCounts,
      required this.snackList,
      required this.onTapAddButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_25X),
      child: GridView.builder(
        itemCount: snackList?.length ?? 0,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: MARGIN_MEDIUM_25X,
            crossAxisSpacing: MARGIN_MEDIUM_25X,
            mainAxisExtent: MARGIN_XLARGE_220X),
        itemBuilder: (context, index) {
          return SnackBoxView(
            onTapPlusButton: () {
              onTapPlusButton(index);
            },
            onTapMinusButton: () => onTapMinusButton(index),
            selectedItemCounts: selectedItemCounts,
            snack: snackList?[index],
            itemCounts: snackList?[index].quantity ?? 0,
            onTapAddButton: () => onTapAddButton(index),
          );
        },
      ),
    );
  }
}

class SnackItemsTabBarView extends StatelessWidget {
  final Function(int) onTapPlusButton;
  final Function(int) onTapMinusButton;
  final bool isShow;
  final int selectedItemCounts;
  final List<SnackVO>? snackList;
  final Function(int) onTapAddButton;

  const SnackItemsTabBarView(
      {super.key,
      required this.onTapPlusButton,
      required this.isShow,
      required this.onTapMinusButton,
      required this.selectedItemCounts,
      required this.snackList,
      required this.onTapAddButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_25X),
      child: GridView.builder(
          itemCount: snackList?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: MARGIN_MEDIUM_25X,
              crossAxisSpacing: MARGIN_MEDIUM_25X,
              mainAxisExtent: MARGIN_XLARGE_220X),
          itemBuilder: (context, index) {
            return SnackBoxView(
              onTapPlusButton: () {
                onTapPlusButton(index);
              },
              onTapMinusButton: () => onTapMinusButton(index),
              selectedItemCounts: selectedItemCounts,
              snack: snackList?[index],
              itemCounts: snackList?[index].quantity ?? 0,
              onTapAddButton: () => onTapAddButton(index),
            );
          }),
    );
  }
}

class ComboItemsTabBarView extends StatelessWidget {
  final Function(int) onTapPlusButton;
  final Function(int) onTapMinusButton;
  final bool isShow;
  final int selectedItemCounts;
  final List<SnackVO>? snackList;
  final Function(int) onTapAddButton;

  const ComboItemsTabBarView(
      {super.key,
      required this.onTapPlusButton,
      required this.isShow,
      required this.onTapMinusButton,
      required this.selectedItemCounts,
      required this.snackList,
      required this.onTapAddButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_25X),
      child: GridView.builder(
          itemCount: snackList?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: MARGIN_MEDIUM_25X,
              crossAxisSpacing: MARGIN_MEDIUM_25X,
              mainAxisExtent: MARGIN_XLARGE_220X),
          itemBuilder: (context, index) {
            return SnackBoxView(
              onTapPlusButton: () => onTapPlusButton(index),
              onTapMinusButton: () => onTapMinusButton(index),
              selectedItemCounts: selectedItemCounts,
              snack: snackList?[index],
              itemCounts: snackList?[index].quantity ?? 0,
              onTapAddButton: () => onTapAddButton(index),
            );
          }),
    );
  }
}

class AlItemsTabBarView extends StatelessWidget {
  final Function(int) onTapPlusButton;
  final Function(int) onTapMinusButton;
  final int selectedItemCounts;
  final List<SnackVO>? allSnackList;
  final Function(int) onTapAddButton;

  const AlItemsTabBarView(
      {Key? key,
      required this.onTapPlusButton,
      required this.onTapMinusButton,
      required this.selectedItemCounts,
      required this.allSnackList,
      required this.onTapAddButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_20X),
      child: GridView.builder(
          itemCount: allSnackList?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: MARGIN_MEDIUM_25X,
              crossAxisSpacing: MARGIN_MEDIUM_25X,
              mainAxisExtent: MARGIN_XLARGE_220X),
          itemBuilder: (context, index) {
            return SnackBoxView(
              onTapPlusButton: () {
                onTapPlusButton(index);
              },
              onTapMinusButton: () => onTapMinusButton(index),
              selectedItemCounts: selectedItemCounts,
              snack: allSnackList?[index],
              itemCounts: allSnackList?[index].quantity ?? 0,
              onTapAddButton: () => onTapAddButton(index),
            );
          }),
    );
  }
}

class AddedSnackItem extends StatelessWidget {
  final Function onTapPlusButton;
  final Function onTapMinusButton;
  final SnackVO? snackItem;

  const AddedSnackItem({
    super.key,
    required this.onTapPlusButton,
    required this.onTapMinusButton,
    required this.snackItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MARGIN_SMALL_8X),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
              width: MARGIN_LARGE_100X + MARGIN_SMALL_10X,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${snackItem?.name}",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: TEXT_MEDIUM,
                      color: WHITE_COLOR),
                ),
              )),
          SizedBox(
            width: MARGIN_LARGE_100X,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SnackShoppingPagePlusButton(
                    imageURL: PLUS_IMAGE, onTapPlusButton: onTapPlusButton),
                const SizedBox(width: MARGIN_MEDIUM_15X),
                Text(
                  "${snackItem?.quantity}",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: TEXT_MEDIUM,
                      color: APP_COLOR_SECONDARY_COLOR),
                ),
                const SizedBox(width: MARGIN_MEDIUM_15X),
                SnackShoppingPageMinusButton(
                    imageURL: MINUS_IMAGE, onTapMinusButton: onTapMinusButton),
              ],
            ),
          ),
          SizedBox(
            width: MARGIN_LARGE_110X,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${snackItem!.price! * 1000 * snackItem!.quantity!} Ks",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: TEXT_MEDIUM,
                    color: WHITE_COLOR),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LargeColaDetailsBar extends StatelessWidget {
  final Function onTapPlusButton;
  final Function onTapMinusButton;
  final int selectedItemCounts;
  final int itemCounts;

  const LargeColaDetailsBar(
      {super.key,
      required this.onTapPlusButton,
      required this.onTapMinusButton,
      required this.selectedItemCounts,
      required this.itemCounts});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: MARGIN_LARGE_100X + MARGIN_SMALL_10X,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Large Cola",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: TEXT_MEDIUM,
                  color: WHITE_COLOR),
            ),
          ),
        ),
        PlusMinusAndItemCountsView(
          selectedItemCounts: selectedItemCounts,
          onTapPlusButton: onTapPlusButton,
          onTapMinusButton: onTapMinusButton,
          itemCount: itemCounts,
        ),
        SizedBox(
          width: MARGIN_LARGE_110X,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "1000Ks",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: TEXT_MEDIUM,
                  color: WHITE_COLOR),
            ),
          ),
        ),
      ],
    );
  }
}
