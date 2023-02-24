import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking/pages/location_page.dart';
import 'package:the_movie_booking/pages/otp_verification_page.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/resources/strings.dart';
import '../widgets/app_default_button_medium.dart';
import '../widgets/app_logo_view.dart';
import '../widgets/subtitle_text.dart';
import '../widgets/title_text.dart';

class PhoneNumberVerificationPage extends StatefulWidget {
  const PhoneNumberVerificationPage({Key? key}) : super(key: key);

  @override
  State<PhoneNumberVerificationPage> createState() =>
      _PhoneNumberVerificationPageState();
}

class _PhoneNumberVerificationPageState
    extends State<PhoneNumberVerificationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedCode = PHNUMBER_VERIFY_PAGE_MM_CODE_TEXT;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: MARGIN_LARGE_80X),
              const AppLogoView(),
              const SizedBox(height: MARGIN_LARGE_80X),
              const TitleText(PHNUMBER_VERIFY_PAGE_TITLE_TEXT),
              const SizedBox(height: MARGIN_SMALL_10X),
              const SubtitleText(PHNUMBER_VERIFY_PAGE_SUBTITLE_TEXT),
              const SizedBox(height: MARGIN_LARGE_60X),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_30X),
                child: CountryCodeAndTextFieldView(context),
              ),
              const SizedBox(height: MARGIN_MEDIUM_50X),
              AppDefaultButtonMedium(
                APP_COLOR_SECONDARY_COLOR,
                PHNUMBER_VERIFY_PAGE_TITLE_TEXT,
                () {
                  bool isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const OTPVerificationPage();
                        },
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: MARGIN_MEDIUM_25X),
              const DividerView(),
              const SizedBox(height: MARGIN_MEDIUM_25X),
              AppDefaultButtonMedium(
                  GOOGLE_SIGN_IN_BUTTON_COLOR,
                  GOOGLE_SIGN_IN_BUTTON_TEXT,
                  googleButtonVisibility: true,
                  () {}),
              const SizedBox(height: MARGIN_LARGE_100X),
              const PolicyText(),
            ],
          ),
        ),
      ),
    );
  }

  Row CountryCodeAndTextFieldView(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showCountryPicker(
              favorite: ['MM'],
              context: context,
              showPhoneCode:
                  true, // optional. Shows phone code before the country name.
              onSelect: (Country country) {
                setState(() {
                  selectedCode = '+${country.phoneCode}';
                });
                print('Select country: ${country.displayName}');
              },
            );
          },
          child: CountryCodeView(selectedCode: selectedCode),
        ),
        const SizedBox(
          width: MARGIN_SMALL_10X,
        ),
        const SizedBox(
          width: MARGIN_XLARGE_250X,
          child: TextFieldView(),
        ),
      ],
    );
  }
}

class CountryCodeView extends StatelessWidget {
  const CountryCodeView({
    Key? key,
    required this.selectedCode,
  }) : super(key: key);

  final String selectedCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MARGIN_LARGE_70X,
      height: MARGIN_MEDIUM_50X,
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.grey, width: MARGIN_SMALL_1X),
      )),
      child: Column(
        children: [
          const Text(
            PHNUMBER_VERIFY_COOUNTRY_CODE_TEXT,
            style: TextStyle(color: Colors.grey, fontSize: TEXT_SMALLEST),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedCode,
                style: const TextStyle(color: WHITE_COLOR),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: GREY_COLOR,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TextFieldView extends StatelessWidget {
  const TextFieldView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: const TextStyle(color: WHITE_GREY_COLOR),
      validator: (str) {
        if (str!.isEmpty) {
          return PHNUMBER_VERIFY_PAGE_ERROR_TEXT1;
        } else if (!(str.length == 10) || !(str.startsWith("9"))) {
          return PHNUMBER_VERIFY_PAGE_ERROR_TEXT2;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: PHNUMBER_VERIFY_PAGE_HINT_TEXT,
        hintStyle: GoogleFonts.inter(
            fontSize: TEXT_LARGE_16X,
            fontWeight: FontWeight.w400,
            color: LIGHT_GREY_COLOR),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

class PolicyText extends StatelessWidget {
  const PolicyText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      POLICY_TEXT,
      style: GoogleFonts.dmSans(
          fontSize: TEXT_SMALL_12X, color: APP_COLOR_TERTIARY_COLOR_2),
    );
  }
}

class DividerView extends StatelessWidget {
  const DividerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_30X),
      child: Row(
        children: [
          const Expanded(
              child: Divider(
            color: PHNUMBER_VERIFY_PAGE_DIVIDER_COLOR,
            thickness: MARGIN_SMALL_1X,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
            child: Text(
              PHNUMBER_VERIFY_PAGE_DIVIDER_TEXT,
              style: GoogleFonts.inter(
                  fontSize: TEXT_LARGE_16X, color: WHITE_COLOR),
            ),
          ),
          const Expanded(
            child: Divider(
              color: PHNUMBER_VERIFY_PAGE_DIVIDER_COLOR,
              thickness: MARGIN_SMALL_1X,
            ),
          ),
        ],
      ),
    );
  }
}
