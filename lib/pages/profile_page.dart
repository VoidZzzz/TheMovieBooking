import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/splash_screen_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/strings.dart';
import '../data/data_vos/payment_vo.dart';
import '../data/models/the_movie_booking_model.dart';
import '../data/models/the_movie_booking_model_impl.dart';
import '../resources/dimens.dart';
import '../resources/images.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TheMovieBookingModel _movieBookingModel = TheMovieBookingModelImpl();
  String? userToken;
  List<PaymentVO>? paymentTypesList;
  int listViewIndex = 0;

  @override
  void initState() {
    /// get User token from database
    setState(() {
      userToken = _movieBookingModel.getUserDataFromDatabase()?.token ?? "";
      print("=============================> USER TOKEN $userToken");
    });

    /// get Payment Types from Network
    _movieBookingModel.getPaymentTypes("Bearer $userToken").then((paymentTypesResponse) {
      paymentTypesList = paymentTypesResponse.data ?? [];
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    List<CardItem> itemList = [
      CardItem(imageUrl: HISTORY_IMAGE, text: PROFILE_PAGE_HISTORY_TEXT),
      CardItem(imageUrl: PERCENT_IMAGE, text: PROFILE_PAGE_OFFER_TEXT),
      CardItem(imageUrl: GIFT_VOUCHER_IMAGE, text: PROFILE_PAGE_GIFT_CARD_TEXT),
      CardItem(imageUrl: LOCATINO_IMAGE_2, text: PROFILE_PAGE_LOCATION_TEXT),
      CardItem(imageUrl: VISA_CARD__IMAGE, text: PROFILE_PAGE_PAYMENT_TEXT),
      CardItem(imageUrl: HELP_AND_SUPPORT_IMAGE, text: PROFILE_PAGE_HELP_TEXT),
      CardItem(imageUrl: LOG_OUT_IMAGE, text: PROFILE_PAGE_LOG_OUT_TEXT),
    ];

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Stack(
                        children: [
                          const Positioned.fill(
                            child: BackGroundImageView(),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                AvatarIconView(),
                                SizedBox(height: MARGIN_MEDIUM_15X),
                                LoginSignupButtonView(),
                                SizedBox(height: TEXT_LARGE_15X),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const GradientView()
                  ],
                ),
              ),
              CategoryListView(
                itemList: itemList,
                onTap: (index) {
                  if (index == 6) {
                    _logoutAlertDialog(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _logoutAlertDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: APP_COLOR_PRIMARY_COLOR,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MARGIN_SMALL_5X),
          ),
          title: const Text(PROFILE_PAGE_LOG_OUT_DIALOG_TITLE_TEXT),
          titleTextStyle: const TextStyle(
              color: WHITE_COLOR,
              fontSize: TEXT_LARGE_18X,
              fontWeight: FontWeight.w600),
          content: Text(
            PROFILE_PAGE_LOG_OUT_DIALOG_CONTENT_TEXT,
            style: GoogleFonts.dmSans(color: WHITE_COLOR),
          ),
          actions: [
            InkWell(
              onTap: () => _navigatorPop(context),
              child: SizedBox(
                width: MARGIN_LARGE_80X,
                height: MARGIN_MEDIUM_40X,
                child: Center(
                  child: Text(
                    PROFILE_PAGE_LOG_OUT_DIALOG_CANCEL_TEXT,
                    style: GoogleFonts.dmSans(
                        color: WHITE_COLOR, fontSize: TEXT_LARGE_16X),
                  ),
                ),
              ),
            ),
            const SizedBox(width: MARGIN_MEDIUM_20X),
            InkWell(
              onTap: () {
                setState(() {
                  _movieBookingModel.userLogout("Bearer $userToken").then((logOutResponse) {
                      _movieBookingModel.clearUserData();
                      _navigateToSplashScreen(context);
                  });
                });
              },
              child: SizedBox(
                width: MARGIN_LARGE_80X,
                height: MARGIN_MEDIUM_40X,
                child: Center(
                  child: Text(
                    PROFILE_PAGE_LOG_OUT_DIALOG_CONFIRM_TEXT,
                    style: GoogleFonts.dmSans(
                        color: WHITE_COLOR, fontSize: TEXT_LARGE_16X),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  void _navigatorPop(BuildContext context) => Navigator.of(context).pop();

  Future<dynamic> _navigateToSplashScreen(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SplashScreenPage(),
      ),
    );
  }
}

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    Key? key,
    required this.itemList,
    required this.onTap,
  }) : super(key: key);

  final List<CardItem> itemList;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return buildCard(
            itemList: itemList[index],
            onTap: () => onTap(index),
          );
        },
      ),
    );
  }
}

class GradientView extends StatelessWidget {
  const GradientView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MARGIN_MEDIUM_50X,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
            colors: [APP_COLOR_PRIMARY_COLOR, Colors.transparent],
          ),
        ),
      ),
    );
  }
}

class LoginSignupButtonView extends StatelessWidget {
  const LoginSignupButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_MEDIUM_35X + MARGIN_SMALL_1X,
      width: MARGIN_XLARGE_200X,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
          border: Border.all(color: APP_COLOR_SECONDARY_COLOR),
          color: LIGHT_GREEN_COLOR),
      child: Center(
        child: Text(
          PROFILE_PAGE_BUTTON_TEXT,
          style: GoogleFonts.inter(
              fontSize: TEXT_LARGE_16X,
              fontWeight: FontWeight.w600,
              color: APP_COLOR_SECONDARY_COLOR),
        ),
      ),
    );
  }
}

class AvatarIconView extends StatelessWidget {
  const AvatarIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: MARGIN_MEDIUM_40X + MARGIN_SMALL_5X,
      backgroundColor: Colors.transparent,
      child: Image.asset(
        PROFILE_ICON_IMAGE,
        fit: BoxFit.cover,
      ),
    );
  }
}

class BackGroundImageView extends StatelessWidget {
  const BackGroundImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      PROFILE_BACK_IMAGE,
      fit: BoxFit.cover,
    );
  }
}

Widget buildCard({required CardItem itemList, required Function onTap}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          height: MARGIN_LARGE_70X,
          decoration: const BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(color: FAINT_WHITE_COLOR, width: MARGIN_SMALL_1X),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MARGIN_MEDIUM_20X,
                width: MARGIN_MEDIUM_25X,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(itemList.imageUrl,
                      color: WHITE_COLOR, fit: BoxFit.fitHeight),
                ),
              ),
              const SizedBox(width: MARGIN_SMALL_10X),
              Text(
                itemList.text,
                style: GoogleFonts.inter(
                    color: WHITE_COLOR,
                    fontWeight: FontWeight.w600,
                    fontSize: TEXT_LARGE_16X + MARGIN_SMALL_1X),
              ),
              const Spacer(),
              const Icon(
                Icons.keyboard_arrow_right,
                color: GREY_COLOR,
                size: MARGIN_MEDIUM_30X,
              )
            ],
          ),
        ),
      ),
    );

class CardItem {
  final String imageUrl;
  final String text;

  CardItem({required this.imageUrl, required this.text});
}
