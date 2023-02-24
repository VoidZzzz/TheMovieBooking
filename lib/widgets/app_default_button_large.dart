import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/images.dart';
import '../resources/dimens.dart';

class AppDefaultButtonLarge extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final bool percentButtonVisibility;
  final Function onTappedButton;

  // final Widget optionalGoogleButton;
  const AppDefaultButtonLarge(this.buttonColor, this.buttonText,this.onTappedButton,
      {super.key, this.percentButtonVisibility = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTappedButton();
      },
      child: Container(
        height: VERIFY_PHONE_NUMBER_BUTTON_HEIGHT,
        width: VERIFY_PHONE_NUMBER_BUTTON_WIDTH,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(BORDER_CIRCULAR_RADIUS)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: percentButtonVisibility,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MARGIN_MEDIUM_20X,
                      width: MARGIN_MEDIUM_20X,
                      child: Center(
                        child: Image.asset(PERCENT_IMAGE),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: MARGIN_SMALL_10X),
              Text(
                buttonText,
                style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: TEXT_LARGE_16X),
              ),
            ],
          ),
        ),
      ),
    );
  }
}