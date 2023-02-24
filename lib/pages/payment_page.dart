import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/ticket_confirmation_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';
import 'package:the_movie_booking/widgets/app_bar_back_arrow.dart';
import 'package:the_movie_booking/widgets/app_default_button_large.dart';
import 'package:the_movie_booking/widgets/title_text.dart';

import '../resources/dimens.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(MARGIN_MEDIUM_20X),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const NameTextFieldView(),
                const SizedBox(height: MARGIN_MEDIUM_15X),
                const DiscountButtonView(),
                const SizedBox(height: MARGIN_MEDIUM_30X),
                const PaymentTitleText(),
                const SizedBox(height: MARGIN_SMALL_10X),
                PaymentListView(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TicketConfirmationPage(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DiscountButtonView extends StatelessWidget {
  const DiscountButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: MARGIN_MEDIUM_15X,
          right: MARGIN_MEDIUM_15X,
          top: MARGIN_MEDIUM_15X),
      child: AppDefaultButtonLarge(
        APP_COLOR_SECONDARY_COLOR,
        PAYMENT_PAGE_PROMO_TEXT,
        () {},
        percentButtonVisibility: true,
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
    return const AppBarBackArrow(iconSize: MARGIN_MEDIUM_25X);
  }
}

class AppBarTitleView extends StatelessWidget {
  const AppBarTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TitleText(PAYMENT_PAGE_TITLE_TEXT);
  }
}

class NameTextFieldView extends StatelessWidget {
  const NameTextFieldView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: MARGIN_MEDIUM_15X,
          right: MARGIN_MEDIUM_15X,
          top: MARGIN_SMALL_10X),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(
            width: MARGIN_XLARGE_300X + MARGIN_SMALL_7X,
            child: TextFormFieldView(),
          ),
          SizedBox(width: MARGIN_SMALL_5X),
          Icon(
            Icons.ac_unit,
            color: Colors.red,
            size: MARGIN_SMALL_10X,
          )
        ],
      ),
    );
  }
}

class TextFormFieldView extends StatelessWidget {
  const TextFormFieldView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      style: GoogleFonts.inter(fontWeight: FontWeight.w700, color: GREY_COLOR),
      cursorColor: GREY_COLOR,
      decoration: InputDecoration(
        filled: true,
        fillColor: APP_COLOR_PRIMARY_COLOR,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_20X, vertical: MARGIN_MEDIUM_20X),
        hintText: PAYMENT_PAGE_HINT_TEXT,
        hintStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w700, color: PAYMENT_PAGE_LABEL_TEXT_COLOR),
        labelText: PAYMENT_PAGE_LABEL_TEXT,
        labelStyle: GoogleFonts.dmSans(
            fontWeight: FontWeight.w700, color: APP_COLOR_SECONDARY_COLOR),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              width: MARGIN_SMALL_2X, color: APP_COLOR_SECONDARY_COLOR),
          borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              width: MARGIN_SMALL_2X, color: APP_COLOR_SECONDARY_COLOR),
          borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
        ),
      ),
    );
  }
}

class PaymentTitleText extends StatelessWidget {
  const PaymentTitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      PAYMENT_PAGE_PAYMENT_SELECTION_TEXT,
      style: GoogleFonts.dmSans(
          fontWeight: FontWeight.w700,
          color: APP_COLOR_SECONDARY_COLOR,
          fontSize: TEXT_LARGE_18X),
    );
  }
}

class PaymentListView extends StatelessWidget {
  final Function onTap;

  const PaymentListView({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.white,
      height: MARGIN_XLARGE_400X + MARGIN_MEDIUM_50X,
      child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                onTap();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: MARGIN_SMALL_6X, horizontal: MARGIN_SMALL_2X),
                child: Container(
                    height: MARGIN_MEDIUM_50X,
                    width: MARGIN_XLARGE_250X,
                    decoration: BoxDecoration(
                      color: APP_COLOR_PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
                      boxShadow: const [
                        BoxShadow(
                            color: PAYMENT_METHODS_BORDER_COLOR,
                            spreadRadius: MARGIN_SMALL_2X,
                            blurRadius: MARGIN_SMALL_1X)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_SMALL_10X),
                      child: Row(
                        children: [
                          SizedBox(
                            height: MARGIN_MEDIUM_30X,
                            width: MARGIN_MEDIUM_30X,
                            child: Image.asset(GIFT_VOUCHER_IMAGE),
                          ),
                          const SizedBox(width: MARGIN_SMALL_10X),
                          Text(PAYMENT_PAGE_GIFT_VOUCHER_TEXT,
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  color: WHITE_COLOR)),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            color: WHITE_COLOR,
                            size: MARGIN_MEDIUM_25X,
                          )
                        ],
                      ),
                    )),
              ),
            );
          }),
    );
  }
}
