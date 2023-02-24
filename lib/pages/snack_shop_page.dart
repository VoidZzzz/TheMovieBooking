import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/check_out_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';
import 'package:the_movie_booking/widgets/app_bar_image_icon_view.dart';
import 'package:the_movie_booking/widgets/title_text_large.dart';
import '../resources/dimens.dart';
import '../widgets/app_bar_back_arrow.dart';
import '../widgets/plus_minus_and_item_counts_view.dart';
import '../widgets/snack_box_view_page.dart';
import '../widgets/snack_shop_page_minus_button.dart';
import '../widgets/snack_shopping_page_plus_button.dart';
import '../widgets/title_text.dart';

class SnackShopPage extends StatefulWidget {
  const SnackShopPage({Key? key}) : super(key: key);

  @override
  State<SnackShopPage> createState() => _SnackShopPageState();
}

class _SnackShopPageState extends State<SnackShopPage> {
  bool iconSwitch = false;
  int cartItemCounts = 2;
  int selectedItemCounts = 0;
  bool isShow = false;
  List<bool> snackList = List.filled(20, false);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        /// App Bar
        appBar: AppBar(
          elevation: MARGIN_SMALLEST,
          automaticallyImplyLeading: false,
          backgroundColor: APP_COLOR_PRIMARY_COLOR,
          leading: const AppBarLeadingView(),
          title: const AppBarTitleView(),
        ),

        /// Body
        body: Stack(
          children: [
            Column(
              children: [
                const TabBarTitleView(),
                Expanded(
                  child: TabBarView(
                    children: [
                      AlItemsTabBarView(
                        onTap: (index) {
                          setState(
                            () {
                              // cartItemCounts++;
                              snackList[index] = true;
                              selectedItemCounts++;
                            },
                          );
                        },
                        onTapMinusButton: (index) {
                          if (selectedItemCounts == 1) {
                            setState(
                              () {
                                snackList[index] = false;
                              },
                            );
                          } else {
                            setState(
                              () {
                                selectedItemCounts--;
                              },
                            );
                          }
                        },
                        list: snackList,
                        selectedItemCounts: selectedItemCounts,
                      ),
                      ComboItemsTabBarView(
                        onTap: () {
                          setState(
                            () {
                              cartItemCounts++;
                              isShow = true;
                            },
                          );
                        },
                        isShow: isShow,
                        onTapMinusButton: () {
                          setState(
                            () {
                              isShow = false;
                            },
                          );
                        },
                        selectedItemCounts: selectedItemCounts,
                      ),
                      SnackItemsTabBarView(
                        onTap: () {
                          setState(
                            () {
                              cartItemCounts++;
                              isShow = true;
                            },
                          );
                        },
                        isShow: isShow,
                        onTapMinusButton: () {
                          setState(
                            () {
                              isShow = false;
                            },
                          );
                        },
                        selectedItemCounts: selectedItemCounts,
                      ),
                      PopCornItemsTabBarView(
                        onTap: () {
                          setState(
                            () {
                              cartItemCounts++;
                              isShow = true;
                            },
                          );
                        },
                        isShow: isShow,
                        onTapMinusButton: () {
                          setState(
                            () {
                              isShow = false;
                            },
                          );
                        },
                        selectedItemCounts: selectedItemCounts,
                      ),
                      BeverageItemsTabBarView(
                        onTap: () {
                          setState(
                            () {
                              cartItemCounts++;
                              isShow = true;
                            },
                          );
                        },
                        isShow: isShow,
                        onTapMinusButton: () {
                          setState(
                            () {
                              isShow = false;
                            },
                          );
                        },
                        selectedItemCounts: selectedItemCounts,
                      ),
                    ],
                  ),
                )
              ],
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
                      horizontal: MARGIN_MEDIUM_25X,
                      vertical: MARGIN_MEDIUM_15X),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      iconSwitch
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                LargeColaDetailsBar(
                                  onTapPlusButton: () {
                                    setState(
                                      () {
                                        cartItemCounts++;
                                      },
                                    );
                                  },
                                  onTapMinusButton: () {
                                    setState(
                                      () {
                                        cartItemCounts--;
                                      },
                                    );
                                  },
                                  selectedItemCounts: selectedItemCounts,
                                ),
                                const SizedBox(height: MARGIN_MEDIUM_20X),
                                PotatoeChipsDetailsBar(
                                  onTapPlusButton: () {
                                    setState(
                                      () {
                                        cartItemCounts++;
                                      },
                                    );
                                  },
                                  onTapMinusButton: () {
                                    setState(
                                      () {
                                        cartItemCounts--;
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(height: MARGIN_MEDIUM_15X),
                              ],
                            )
                          : Container(),

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
                                        cartItemCounts.toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: TEXT_SMALLEST,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      badgeStyle: const BadgeStyle(
                                          badgeColor: Colors.deepOrange),
                                      showBadge:
                                          cartItemCounts > 0 ? true : false,
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
                                        return const CheckOutPage();
                                      },
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: MARGIN_LARGE_90X,
                                  height: MARGIN_MEDIUM_50X,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "2000Ks",
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
      ),
    );
  }
}

class TabBarTitleView extends StatelessWidget {
  const TabBarTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_10X),
      child: TabBar(
        indicatorColor: APP_COLOR_SECONDARY_COLOR,
        isScrollable: true,
        labelPadding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_18X),
        labelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600, fontSize: TEXT_LARGE_16X),
        tabs: const [
          Tab(text: SNACK_SHOP_PAGE_ALL_SNACK_TEXT),
          Tab(text: SNACK_SHOP_PAGE_COMBO_SNACK_TEXT),
          Tab(text: SNACK_SHOP_PAGE_SNACK_TEXT),
          Tab(text: SNACK_SHOP_PAGE_POP_CORN_TEXT),
          Tab(text: SNACK_SHOP_PAGE_BEVERAGE_TEXT)
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
  const AppBarTitleView({
    Key? key,
  }) : super(key: key);

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
                  return const CheckOutPage();
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
  final Function onTap;
  final Function onTapMinusButton;
  final bool isShow;
  final int selectedItemCounts;

  const BeverageItemsTabBarView(
      {super.key,
      required this.onTap,
      required this.isShow,
      required this.onTapMinusButton,
      required this.selectedItemCounts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_25X),
      child: GridView.builder(
          itemCount: 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: MARGIN_MEDIUM_25X,
              crossAxisSpacing: MARGIN_MEDIUM_25X,
              mainAxisExtent: MARGIN_XLARGE_220X),
          itemBuilder: (context, index) {
            return SnackBoxView(
              onTapAddButton: () {
                onTap();
              },
              isShow: isShow,
              onTapMinusButton: onTapMinusButton,
              selectedItemCounts: selectedItemCounts,
            );
          }),
    );
  }
}

class PopCornItemsTabBarView extends StatelessWidget {
  final Function onTap;
  final Function onTapMinusButton;
  final bool isShow;
  final int selectedItemCounts;

  const PopCornItemsTabBarView(
      {super.key,
      required this.onTap,
      required this.isShow,
      required this.onTapMinusButton,
      required this.selectedItemCounts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_25X),
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: MARGIN_MEDIUM_25X,
            crossAxisSpacing: MARGIN_MEDIUM_25X,
            mainAxisExtent: MARGIN_XLARGE_220X),
        itemBuilder: (context, index) {
          return SnackBoxView(
            onTapAddButton: () {
              onTap();
            },
            isShow: isShow,
            onTapMinusButton: onTapMinusButton,
            selectedItemCounts: selectedItemCounts,
          );
        },
      ),
    );
  }
}

class SnackItemsTabBarView extends StatelessWidget {
  final Function onTap;
  final Function onTapMinusButton;
  final bool isShow;
  final int selectedItemCounts;

  const SnackItemsTabBarView(
      {super.key,
      required this.onTap,
      required this.isShow,
      required this.onTapMinusButton,
      required this.selectedItemCounts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_25X),
      child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: MARGIN_MEDIUM_25X,
              crossAxisSpacing: MARGIN_MEDIUM_25X,
              mainAxisExtent: MARGIN_XLARGE_220X),
          itemBuilder: (context, index) {
            return SnackBoxView(
              onTapAddButton: () {
                onTap();
              },
              isShow: isShow,
              onTapMinusButton: onTapMinusButton,
              selectedItemCounts: selectedItemCounts,
            );
          }),
    );
  }
}

class ComboItemsTabBarView extends StatelessWidget {
  final Function onTap;
  final Function onTapMinusButton;
  final bool isShow;
  final int selectedItemCounts;

  const ComboItemsTabBarView(
      {super.key,
      required this.onTap,
      required this.isShow,
      required this.onTapMinusButton,
      required this.selectedItemCounts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_25X),
      child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: MARGIN_MEDIUM_25X,
              crossAxisSpacing: MARGIN_MEDIUM_25X,
              mainAxisExtent: MARGIN_XLARGE_220X),
          itemBuilder: (context, index) {
            return SnackBoxView(
              onTapAddButton: () {
                onTap();
              },
              isShow: isShow,
              onTapMinusButton: onTapMinusButton,
              selectedItemCounts: selectedItemCounts,
            );
          }),
    );
  }
}

class AlItemsTabBarView extends StatelessWidget {
  final Function(int) onTap;
  final Function(int) onTapMinusButton;
  final int selectedItemCounts;
  final List<bool> list;

  const AlItemsTabBarView(
      {Key? key,
      required this.onTap,
      required this.onTapMinusButton,
      required this.list,
      required this.selectedItemCounts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_25X),
      child: GridView.builder(
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: MARGIN_XLARGE_220X,
            mainAxisSpacing: MARGIN_MEDIUM_25X,
            crossAxisSpacing: MARGIN_MEDIUM_25X,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return SnackBoxView(
            onTapAddButton: () {
              onTap(index);
            },
            onTapMinusButton: () {
              onTapMinusButton(index);
            },
            isShow: list[index],
            selectedItemCounts: selectedItemCounts,
          );
        },
      ),
    );
  }
}

class PotatoeChipsDetailsBar extends StatelessWidget {
  final Function onTapPlusButton;
  final Function onTapMinusButton;

  const PotatoeChipsDetailsBar(
      {super.key,
      required this.onTapPlusButton,
      required this.onTapMinusButton});

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
                "Potatoe Chips",
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
                "1",
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

class LargeColaDetailsBar extends StatelessWidget {
  final Function onTapPlusButton;
  final Function onTapMinusButton;
  final int selectedItemCounts;

  const LargeColaDetailsBar(
      {super.key,
      required this.onTapPlusButton,
      required this.onTapMinusButton,
      required this.selectedItemCounts});

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
            onTapMinusButton: onTapMinusButton),
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
