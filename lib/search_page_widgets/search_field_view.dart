import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class SearchFieldView extends StatefulWidget {
  final String text;
  final Function onSubmitted;

  const SearchFieldView(
      {super.key, required this.text, required this.onSubmitted});

  @override
  State<SearchFieldView> createState() => _SearchFieldViewState();
}

class _SearchFieldViewState extends State<SearchFieldView> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: WHITE_COLOR,
      textInputAction: TextInputAction.search,
      autofocus: true,
      onFieldSubmitted: (value) {
        print("========================================> $value");
        widget.onSubmitted();
      },
      style: GoogleFonts.inter(color: WHITE_COLOR, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
        border: InputBorder.none,
        hintText: widget.text,
        hintStyle:
        GoogleFonts.inter(color: GREY_COLOR, fontWeight: FontWeight.w400),
      ),
    );
  }
}