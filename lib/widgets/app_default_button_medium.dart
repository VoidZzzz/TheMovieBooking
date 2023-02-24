import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/images.dart';
import '../resources/dimens.dart';

class AppDefaultButtonMedium extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final bool googleButtonVisibility;
  final Function onTappedButton;

  // final Widget optionalGoogleButton;
  const AppDefaultButtonMedium(this.buttonColor, this.buttonText,this.onTappedButton,
      {super.key, this.googleButtonVisibility = false});

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
                visible: googleButtonVisibility,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MARGIN_MEDIUM_25X,
                      width: MARGIN_MEDIUM_25X,
                      child: Center(
                        child: Image.asset(GOOGLE_LOGO_IMAGE),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: MARGIN_SMALL_10X),
              Text(
                buttonText,
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: TEXT_LARGE_16X),
              ),
            ],
          ),
        ),
      ),
    );
  }
}