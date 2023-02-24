import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/dimens.dart';

import '../resources/colors.dart';
class DottedLineView extends StatelessWidget {
  const DottedLineView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_SMALL_6X),
      child: DottedLine(
        lineThickness: 2,
        dashLength: 8,
        lineLength: MediaQuery.of(context).size.width * MARGIN_XSMALL_2,
        dashColor:
        VOUCHER_CONFIRMATION_PAGE_DOTTED_LINE_COLOR,
      ),
    );
  }
}