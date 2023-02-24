import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/dimens.dart';

class AppDefaultButtonSmall extends StatelessWidget {
  final Function onTappedButton;
  final String buttonText;
  final Color buttonColor;

  const AppDefaultButtonSmall({super.key, required this.buttonText, required this.buttonColor, required this.onTappedButton});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTappedButton();
      },
      child: Container(
        height: VERIFY_PHONE_NUMBER_BUTTON_HEIGHT,
        width: MARGIN_LARGE_180X,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(BORDER_CIRCULAR_RADIUS)),
        child: Center(
          child: Text(
            buttonText,
            style: GoogleFonts.inter(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: TEXT_LARGE_18X),
          ),
        ),
      ),
    );
  }
}
