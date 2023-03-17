import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking/authentication/data/data_vos/cities_vo.dart';
import 'package:the_movie_booking/authentication/data/models/the_movie_booking_model_impl.dart';
import 'package:the_movie_booking/pages/bottom_navigation_bar_home_page.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/resources/strings.dart';
import '../authentication/data/models/the_movie_booking_model.dart';
import '../resources/colors.dart';
import 'package:drop_shadow/drop_shadow.dart';

import '../widgets/location_page_location_box.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  TheMovieBookingModel theMovieBookingModel = TheMovieBookingModelImpl();

  List<CitiesVO> citiesList = [];

  @override
  void initState() {
    /// GetCities From Database
    theMovieBookingModel.getCitiesFromDatabase().then((cities) {
      setState(() {
        citiesList = cities ?? [];
      });
      debugPrint(
          "======================================> ${cities?.length}");
    }).catchError((error) {
      debugPrint(error.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: MARGIN_MEDIUM_20X),
              const LocationScreenTitleView(),
              const SizedBox(height: MARGIN_MEDIUM_20X),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  LocationScreenSearchBox(),
                  SizedBox(width: MARGIN_MEDIUM_20X),
                  LocationScreenLocationBox()
                ],
              ),
              const SizedBox(height: MARGIN_MEDIUM_30X),
              const LocationScreenCitiesImageView(),
              const LocationScreenCitiesTitleView(),
              LocationScreenCityNamesListView(
                      (city) => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNaviBarHomePage(),
                            ),
                          ),
                      citiesList),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationScreenTitleView extends StatelessWidget {
  const LocationScreenTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropShadow(
      offset: const Offset(MARGIN_SMALLEST, MARGIN_SMALLEST),
      child: Text(
        LOCATION_PAGE_TITLE_TEXT,
        style: GoogleFonts.dmSans(
            color: APP_COLOR_SECONDARY_COLOR,
            fontWeight: FontWeight.w700,
            fontSize: MARGIN_MEDIUM_18X),
      ),
    );
  }
}

class LocationScreenCityNamesListView extends StatelessWidget {
  const LocationScreenCityNamesListView(this.onTapCity, this.citiesList,
      {super.key});

  final List<CitiesVO>? citiesList;
  final Function(String) onTapCity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: citiesList?.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onTapCity(citiesList?[index].name ?? "");
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: MARGIN_SMALL_2X),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: DARK_GREY_COLOR, width: MARGIN_SMALL_2X),
                ),
              ),
              padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_20X, top: MARGIN_MEDIUM_20X),
              height: MARGIN_LARGE_60X,
              width: double.maxFinite,
              child: Text(
                citiesList?[index].name ?? "",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: TEXT_LARGE_15X,
                    color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

class LocationScreenCitiesTitleView extends StatelessWidget {
  const LocationScreenCitiesTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CITIES_SCREEN_TITLE_BOX_COLOR,
      height: MARGIN_MEDIUM_40X,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(
            left: MARGIN_MEDIUM_20X, top: MARGIN_SMALL_10X),
        child: Text(
          LOCATION_PAGE_CITIES_TEXT,
          style: GoogleFonts.inter(
              fontSize: TEXT_LARGE_15X,
              fontWeight: FontWeight.w400,
              color: WHITE_COLOR),
        ),
      ),
    );
  }
}

class LocationScreenCitiesImageView extends StatelessWidget {
  const LocationScreenCitiesImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SizedBox(
          height: MARGIN_MEDIUM_50X,
          width: MARGIN_LARGE_90X,
          child: Image.asset(
            CITIES_IMAGE,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class LocationScreenSearchBox extends StatelessWidget {
  const LocationScreenSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_MEDIUM_50X,
      width: MARGIN_XLARGE_300X,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            CITIES_SCREEN_TEXTFIELD_GRADIENT_COLOR_1,
            CITIES_SCREEN_TEXTFIELD_GRADIENT_COLOR_2,
            CITIES_SCREEN_TEXTFIELD_GRADIENT_COLOR_3
          ],
        ),
      ),
      child: const LocationScreenSearchIconAndTextFieldView(),
    );
  }
}

class LocationScreenSearchIconAndTextFieldView extends StatelessWidget {
  const LocationScreenSearchIconAndTextFieldView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.inter(
          fontWeight: FontWeight.w400,
          color: GREY_COLOR,
          fontSize: TEXT_MEDIUM),
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        //focused border
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
        ),
        contentPadding: const EdgeInsets.only(top: MARGIN_MEDIUM_15X),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(MARGIN_MEDIUM_16X),
          child: Image.asset(SEARCH_ICON_IMAGE),
        ),
        hintText: LOCATION_PAGE_SERACH_FIELD_TEXT,
        hintStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            color: GREY_COLOR,
            fontSize: TEXT_LARGE_16X),
      ),
    );
  }
}
