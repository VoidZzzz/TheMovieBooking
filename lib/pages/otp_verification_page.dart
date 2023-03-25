import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/pages/location_page.dart';
import 'package:the_movie_booking/pages/phone_number_verification_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/strings.dart';
import 'package:the_movie_booking/widgets/app_default_button_medium.dart';
import 'package:the_movie_booking/widgets/app_logo_view.dart';
import 'package:the_movie_booking/widgets/subtitle_text.dart';
import 'package:the_movie_booking/widgets/title_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../data/models/the_movie_booking_model.dart';
import '../data/models/the_movie_booking_model_impl.dart';

class OTPVerificationPage extends StatefulWidget {
  final String userPhone;

  const OTPVerificationPage({
    Key? key,
    required this.userPhone,
  }) : super(key: key);

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {

  /// Ui Variables
  bool isComplete = false;
  String otp = '';
  String? otpResponse;

  /// Api Variables
  final TheMovieBookingModel _movieBookingModel = TheMovieBookingModelImpl();

  @override
  void initState() {
    debugPrint("====================================> USER PHONE NUMBER +95${widget.userPhone}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: MARGIN_LARGE_80X),
            const AppLogoView(),
            const SizedBox(height: MARGIN_LARGE_80X),
            const TitleText(OTP_CONFIRM_PAGE_TITLE_TEXT),
            const SizedBox(height: MARGIN_SMALL_10X),
            const SubtitleText(OTP_CONFIRM_PAGE_OTP_CODE_SENT_TEXT),
            const SizedBox(height: MARGIN_LARGE_80X),
            SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_30X),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EnterOtpTextView(),
                    const SizedBox(height: MARGIN_SMALL_8X),
                    PinCodeTextField(
                      showCursor: false,
                      validator: (str) {
                        return null;
                      },
                      enableActiveFill: true,
                      textStyle: GoogleFonts.dmSans(
                          color: APP_COLOR_TERTIARY_COLOR_2,
                          fontWeight: FontWeight.w500,
                          fontSize: TEXT_MEDIUM),
                      pinTheme: PinTheme(
                          activeColor: Colors.white,
                          selectedColor: GREY_COLOR,
                          inactiveColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: GREY_COLOR,
                          activeFillColor: Colors.white,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(MARGIN_SMALL_4X),
                          errorBorderColor: Colors.red,
                          fieldHeight: MARGIN_MEDIUM_50X,
                          fieldWidth: MARGIN_MEDIUM_50X),
                      keyboardType: TextInputType.number,
                      appContext: context,
                      length: 6,
                      onChanged: (text) {
                        if (text.length == 6) {
                          setState(() {
                            otp = text;
                            isComplete = true;
                          });
                        } else {
                          setState(() {
                            isComplete = false;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: MARGIN_MEDIUM_50X),
            const ResendTextView(),
            const SizedBox(height: MARGIN_MEDIUM_50X),
            AppDefaultButtonMedium(
              isComplete ? APP_COLOR_SECONDARY_COLOR : GREY_COLOR,
              OTP_CONFIRM_PAGE_OTP_CONFIRM_TEXT,
              () {
                /// Sign In with Phone
                if (isComplete) {
                  _movieBookingModel
                      .getSignInWithPhone(widget.userPhone, otp)
                      .then((otp) {
                    setState(() {
                      otpResponse = otp.message;
                    });
                    if (otp.code == 201) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LocationPage(),
                        ),
                      );
                    } else {
                      debugPrint('=================> ${otp.message}');
                      dialogView(context);
                    }
                  }).catchError((error) {
                    debugPrint('error ====================> $error');
                  });
                }
              },
            ),
            const SizedBox(height: MARGIN_LARGE_90X),
            const PolicyText()
          ],
        ),
      ),
    );
  }

  Future<dynamic> dialogView(BuildContext context) {
    return AwesomeDialog(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.leftSlide,
      title: PHNUMBER_VERIFY_PAGE_WRONG_OTP_DIALOG_HEADER_TEXT,
      titleTextStyle: GoogleFonts.dmSans(
          fontWeight: FontWeight.w800, fontSize: TEXT_LARGE_22X),
      desc: PHNUMBER_VERIFY_PAGE_WRONG_OTP_DIALOG_DES_TEXT,
      btnOk: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MARGIN_MEDIUM_40X,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(MARGIN_SMALL_10X),
          ),
          child: Center(
            child: Text(
              PHNUMBER_VERIFY_PAGE_WRONG_OTP_DIALOG_OK_TEXT,
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600, fontSize: TEXT_LARGE_16X),
            ),
          ),
        ),
      ),
    ).show();
  }
}

class ResendTextView extends StatelessWidget {
  const ResendTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: OTP_CONFIRM_PAGE_NO_OTP_CODE_TEXT,
            style: GoogleFonts.inter(
                color: WHITE_COLOR, fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: OTP_CONFIRM_PAGE_REQUEST_OTP_CODE_TEXT,
            style: GoogleFonts.inter(
                color: APP_COLOR_SECONDARY_COLOR, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class EnterOtpTextView extends StatelessWidget {
  const EnterOtpTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      OTP_CONFIRM_PAGE_ENTER_OTP_TEXT,
      style: GoogleFonts.dmSans(
          color: HOME_SCREEN_ENTER_OTP_TEXT_COLOR,
          fontSize: TEXT_MEDIUM,
          fontWeight: FontWeight.w400),
    );
  }
}
