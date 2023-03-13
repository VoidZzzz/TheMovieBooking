import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/resources/images.dart';
import 'package:the_movie_booking/search_page_widgets/search_field_view.dart';

import '../resources/colors.dart';
import '../resources/strings.dart';
import '../search_pages/movie_search_page.dart';
import '../widgets/app_bar_back_arrow.dart';
import '../widgets/app_bar_image_icon_view.dart';

class SearchPagesAppBarTitleView extends StatefulWidget {
  const SearchPagesAppBarTitleView(
      {Key? key, required this.text,required this.onSubmitted})
      : super(key: key);

  final String text;
  final Function onSubmitted;

  @override
  State<SearchPagesAppBarTitleView> createState() => _SearchPagesAppBarTitleViewState();
}

class _SearchPagesAppBarTitleViewState extends State<SearchPagesAppBarTitleView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppBarBackArrow(
          iconSize: MARGIN_MEDIUM_20X,
        ),
        const SizedBox(
          width: MARGIN_SMALL_10X,
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_17X,
          width: MARGIN_MEDIUM_17X,
          child: AppBarImageIconView(SEARCH_ICON_IMAGE),
        ),
        SizedBox(
          width: MARGIN_XLARGE_270X,
          child: SearchFieldView(
            text: widget.text,
            onSubmitted: widget.onSubmitted,
          ),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM_20X,
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_18X,
          width: MARGIN_MEDIUM_18X,
          child: AppBarImageIconView(
            FILTER_IMAGE,
            imageColor: APP_COLOR_SECONDARY_COLOR,
          ),
        ),
      ],
    );
  }
}
