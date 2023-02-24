import 'package:flutter/material.dart';
import 'package:the_movie_booking/resources/colors.dart';
import 'package:the_movie_booking/resources/dimens.dart';
import 'package:the_movie_booking/widgets/right_semi_circle_view.dart';
import '../pages/ticket_confirmation_page.dart';
import 'left_semi_circle_view.dart';

class TicketInformationView extends StatelessWidget {
  const TicketInformationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_20X),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_SMALL_8X),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: const [
            GradientView(),
            TicketDetailsView(),
            Positioned(left: MARGIN_SMALLEST, bottom: MARGIN_LARGE_125X, child: LeftSemiCircleContainer(),),
            Positioned(
                bottom: MARGIN_LARGE_125X, right: MARGIN_SMALLEST, child: RightSemiCircleContainer(),),
          ],
        ),
      ),
    );
  }
}
